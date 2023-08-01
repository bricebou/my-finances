import 'dart:async';

import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/storage/storage_helpers.dart';
import 'package:app/features/user/data/entities/auth.dart';
import 'package:app/features/user/data/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

/// This controller is an [AsyncNotifier] that holds and handles our authentication state
@riverpod
class AuthController extends _$AuthController {
  @override
  Future<Auth> build() async {
    _persistenceRefreshLogic();

    return _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<Auth> _loginRecoveryAttempt() async {
    try {
      final savedToken = ref.read(storageHelpersProvider).getAuthToken();
      if (savedToken == null) {
        throw const AppException(message: 'app_error_no_auth_token_found');
      }

      return Auth.signedIn(token: savedToken);
    } catch (_, __) {
      ref.read(storageHelpersProvider).unsetAuthToken();
      return const Auth.signedOut();
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    state = const AsyncLoading();

    try {
      final auth = await ref.watch(authRepositoryProvider).logout();
      state = AsyncData<Auth>(auth);
    } on DioException catch (e) {
      final appError = AppException.fromDioException(e);
      state = AsyncError(appError, e.stackTrace);
      throw appError;
    }
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    try {
      final auth = await ref
          .watch(authRepositoryProvider)
          .login(email: email, password: password);
      state = AsyncData<Auth>(auth);
    } on DioException catch (e) {
      final appError = AppException.fromDioException(e);
      state = AsyncError(appError, e.stackTrace);
      throw appError;
    }
  }

  /// Internal method used to listen authentication state changes.
  /// When the auth object is in a loading state, nothing happens.
  /// When the auth object is in a error state, we choose to remove the token
  /// Otherwise, we expect the current auth value to be reflected in our persitence API
  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        ref.read(storageHelpersProvider).unsetAuthToken();
        return;
      }

      next.requireValue.map<void>(
        signedIn: (signedIn) => ref
            .read(storageHelpersProvider)
            .setAuthToken(token: signedIn.token),
        signedOut: (signedOut) {
          ref.read(storageHelpersProvider).unsetAuthToken();
        },
      );
    });
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      final auth = await ref
          .watch(authRepositoryProvider)
          .register(name: name, email: email, password: password);
      state = AsyncData<Auth>(auth);
    } on DioException catch (e) {
      final appError = AppException.fromDioException(e);
      state = AsyncError(appError, e.stackTrace);
      throw appError;
    }
  }
}

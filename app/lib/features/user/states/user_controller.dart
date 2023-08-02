import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/features/user/data/entities/user.dart';
import 'package:app/features/user/data/repositories/user_repository.dart';
import 'package:app/features/user/states/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  Future<User> build() async {
    return getUser();
  }

  Future<User> getUser() async {
    try {
      final user = await ref.watch(userRepositoryProvider).getUser();
      return user;
    } on DioException catch (e) {
      final appException = AppException.fromDioException(e);
      throw appException;
    }
  }

  Future<void> uploadAvatar({required FormData data}) async {
    state = const AsyncLoading();

    try {
      state = AsyncData(
        await ref.watch(userRepositoryProvider).updateAvatar(data: data),
      );
    } on DioException catch (e) {
      final appException = AppException.fromDioException(e);
      state = AsyncError(appException, e.stackTrace);
      throw appException;
    }
  }

  Future<void> updateUser({required String name, required String email}) async {
    try {
      state = AsyncData(
        await ref
            .watch(userRepositoryProvider)
            .updateUser(name: name, email: email),
      );
    } on DioException catch (e) {
      final appException = AppException.fromDioException(e);
      throw appException;
    }
  }

  Future<void> destroy() async {
    try {
      final auth = await ref.read(userRepositoryProvider).delete();
      ref.read(authControllerProvider.notifier).state = AsyncData(auth);
    } on DioException catch (e) {
      final appException = AppException.fromDioException(e);
      throw appException;
    }
  }
}

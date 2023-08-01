import 'package:app/features/user/data/api/auth_api.dart';
import 'package:app/features/user/data/entities/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository(
      api: ref.watch(authApiProvider),
    );

class AuthRepository {
  AuthRepository({required this.api});

  final AuthApi api;

  Future<Auth> login({required String email, required String password}) async {
    try {
      final response = await api.login(email: email, password: password);
      return Auth.signedIn(token: response.data['token'].toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<Auth> logout() async {
    try {
      final response = await api.logout();
      return const Auth.signedOut();
    } catch (e) {
      rethrow;
    }
  }
}

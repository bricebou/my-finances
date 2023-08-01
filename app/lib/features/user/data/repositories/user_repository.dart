import 'package:app/features/user/data/api/user_api.dart';
import 'package:app/features/user/data/entities/auth.dart';
import 'package:app/features/user/data/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository(
      api: ref.watch(userApiProvider),
    );

class UserRepository {
  UserRepository({required this.api});

  final UserApi api;

  Future<User> getUser() async {
    try {
      final response = await api.getUser();
      return User.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateAvatar({required FormData data}) async {
    try {
      final response = await api.updateAvatar(data: data);
      return User.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateUser({required String name, required String email}) async {
    try {
      final response = await api.updateUser(name: name, email: email);
      return User.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<Auth> delete() async {
    try {
      await api.deleteUser();
      return const Auth.signedOut();
    } catch (e) {
      rethrow;
    }
  }
}

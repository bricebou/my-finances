import 'package:app/core/api/dio_client.dart';
import 'package:app/utils/config/api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_api.g.dart';

@riverpod
UserApi userApi(UserApiRef ref) => UserApi(
      ref.read(dioClientProvider),
    );

class UserApi {
  UserApi(this._dioClient);

  final DioClient _dioClient;

  Future<Response<dynamic>> getUser() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.user.path);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> updateAvatar({required FormData data}) async {
    try {
      final response =
          await _dioClient.post(ApiEndpoints.avatar.path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> updateUser(
      {required String name, required String email}) async {
    try {
      final response = await _dioClient.put(
        ApiEndpoints.user.path,
        data: {
          'name': name,
          'email': email,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> deleteUser() async {
    try {
      final response = await _dioClient.delete(ApiEndpoints.user.path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

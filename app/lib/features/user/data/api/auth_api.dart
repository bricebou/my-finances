import 'package:app/core/api/dio_client.dart';
import 'package:app/utils/config/api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_api.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) => AuthApi(
      ref.read(dioClientProvider),
    );

class AuthApi {
  AuthApi(this._dioClient);

  final DioClient _dioClient;

  Future<Response<dynamic>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.login.path,
        data: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> logout() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.logout.path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

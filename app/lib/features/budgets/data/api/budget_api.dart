import 'package:app/core/api/dio_client.dart';
import 'package:app/utils/config/api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_api.g.dart';

@riverpod
BudgetApi budgetApi(BudgetApiRef ref) => BudgetApi(
      ref.read(dioClientProvider),
    );

class BudgetApi {
  BudgetApi(this._dioClient);

  final DioClient _dioClient;

  Future<Response<dynamic>> index() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.budget.path);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> show({String? id}) async {
    late Response<dynamic> response;
    try {
      if (id == null) {
        response = await _dioClient.get(ApiEndpoints.budgetLatest.path);
      } else {
        response = await _dioClient.get('${ApiEndpoints.budget.path}/$id');
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

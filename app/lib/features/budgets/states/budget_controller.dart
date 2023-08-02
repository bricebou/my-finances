import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/features/budgets/data/entities/budget.dart';
import 'package:app/features/budgets/data/repositories/budget_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_controller.g.dart';

@riverpod
class BudgetController extends _$BudgetController {
  @override
  Future<Budget> build(String? id) async {
    try {
      final response = await ref.watch(budgetRepositoryProvider).show(id: id);
      return response;
    } on DioException catch (e) {
      final appException = AppException.fromDioException(e);
      throw appException;
    }
  }
}

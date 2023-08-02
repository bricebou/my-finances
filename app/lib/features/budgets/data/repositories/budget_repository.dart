import 'package:app/features/budgets/data/api/budget_api.dart';
import 'package:app/features/budgets/data/entities/budget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_repository.g.dart';

@riverpod
BudgetRepository budgetRepository(BudgetRepositoryRef ref) => BudgetRepository(
      api: ref.watch(budgetApiProvider),
    );

class BudgetRepository {
  BudgetRepository({required this.api});

  final BudgetApi api;

  Future<List<Budget>> index() async {
    final budgetList = <Budget>[];
    try {
      final response = await api.index();
      final rawList = response.data['data'] as List<dynamic>;
      for (final element in rawList) {
        budgetList.add(Budget.fromJson(element as Map<String, dynamic>));
      }
      return budgetList;
    } catch (e) {
      rethrow;
    }
  }

  Future<Budget> show({String? id}) async {
    try {
      final response = await api.show(id: id);
      return Budget.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}

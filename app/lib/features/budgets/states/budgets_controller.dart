import 'package:app/features/budgets/data/entities/budget.dart';
import 'package:app/features/budgets/data/repositories/budget_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budgets_controller.g.dart';

@riverpod
class BudgetsController extends _$BudgetsController {
  @override
  Future<List<Budget>> build() async {
    final list = await ref.watch(budgetRepositoryProvider).index();
    return list;
  }
}

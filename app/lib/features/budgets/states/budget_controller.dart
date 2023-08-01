import 'package:app/features/budgets/data/entities/budget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_controller.g.dart';

@riverpod
class BudgetController extends _$BudgetController {
  @override
  Future<Budget> build(String id) async {
    final response =
        Future.delayed(Duration(seconds: 1)).then((value) => Budget(id: id));
    return response;
  }
}

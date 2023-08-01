import 'package:app/features/budgets/states/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BudgetPage extends ConsumerWidget {
  const BudgetPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetControllerProvider(id));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: state.isLoading
              ? CircularProgressIndicator()
              : Text("Budget with id ${state.value?.id}"),
        ),
      ),
    );
  }
}

import 'package:app/core/router/routes.dart';
import 'package:app/features/budgets/data/entities/budget.dart';
import 'package:app/features/user/states/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class BudgetsListWidget extends ConsumerWidget {
  const BudgetsListWidget({super.key, required this.budgets});

  final List<Budget> budgets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: budgets.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            shape: const Border(
              bottom: BorderSide(color: Colors.black12),
            ),
            title: Text(
              '${DateFormat.yMMMMd(ref.read(setLocaleProvider).value?.languageCode).format(budgets[index].startDate)} - ${DateFormat.yMMMMd(ref.read(setLocaleProvider).value?.languageCode).format(budgets[index].endDate)}',
            ),
            onTap: () {
              BudgetRoute(budgets[index].id).go(context);
            },
          );
        });
  }
}

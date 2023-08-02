import 'package:app/features/budgets/states/budget_controller.dart';
import 'package:app/features/user/states/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class BudgetPage extends ConsumerWidget {
  const BudgetPage({this.id, super.key});

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetControllerProvider(id));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
            child: state.isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Text(
                        '${DateFormat.yMMMMd(ref.read(setLocaleProvider).value?.languageCode).format(state.value!.startDate)} - ${DateFormat.yMMMMd(ref.read(setLocaleProvider).value?.languageCode).format(state.value!.endDate)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                            ),
                            child: Row(
                              children: [
                                Text('Incomes'),
                                Text(NumberFormat.simpleCurrency(
                                        locale: ref
                                            .read(setLocaleProvider)
                                            .value
                                            ?.toString())
                                    .format(state.value!.totalIncomes))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
      ),
    );
  }
}

import 'package:app/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BudgetsPage extends ConsumerWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Budgets"),
              ElevatedButton(
                  onPressed: () {
                    BudgetRoute('test').go(context);
                  },
                  child: Text("test")),
              ElevatedButton(
                  onPressed: () {
                    BudgetRoute('bis').go(context);
                  },
                  child: Text("bis"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/exceptions/app_exceptions_translator.dart';
import 'package:app/core/exceptions/app_exceptions_widget.dart';
import 'package:app/features/budgets/states/budgets_controller.dart';
import 'package:app/features/budgets/ui/widgets/budgets_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BudgetsListPage extends ConsumerWidget {
  const BudgetsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(budgetsControllerProvider);

    return Scaffold(
      body: list.when(
        data: (data) => BudgetsListWidget(budgets: data),
        error: (error, stacktrace) {
          final appException = AppExceptionsTranslator(
            context: context,
            exception: error as AppException,
          ).translate();
          AppExceptionWidget(appException: appException);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

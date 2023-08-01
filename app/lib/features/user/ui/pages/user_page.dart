import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/exceptions/app_exceptions_translator.dart';
import 'package:app/core/exceptions/app_exceptions_widget.dart';
import 'package:app/features/user/states/user_controller.dart';
import 'package:app/features/user/ui/pages/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserPage> {
  @override
  Widget build(BuildContext context) {
    final userController = ref.watch(userControllerProvider);

    return Scaffold(
      body: userController.when(
        data: (data) => Center(
          child: UserWidget(
            user: data,
          ),
        ),
        error: (error, stacktrace) {
          final exception = AppExceptionsTranslator(
            context: context,
            exception: error as AppException,
          ).translate();
          return Center(
            child: AppExceptionWidget(
              appException: exception,
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

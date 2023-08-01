import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/features/main/ui/widgets/custom_snackbar.dart';
import 'package:app/features/user/states/auth_controller.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:app/utils/translators/app_exceptions_translator.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  bool _isHidden = true;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final validatorEmail = ValidationBuilder().required().email().build();
  final validatorPassword = ValidationBuilder().required().build();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: const Size.fromWidth(360).width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        //height: double.infinity,
        alignment: Alignment.center,
        child: Form(
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailEditingController,
                decoration: InputDecoration(
                  labelText: L.of(context).form_label_email,
                  labelStyle: const TextStyle(color: Colors.black54),
                ),
                style: const TextStyle(color: Colors.black),
                validator: validatorEmail,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordEditingController,
                decoration: InputDecoration(
                  labelText: L.of(context).form_label_password,
                  labelStyle: const TextStyle(color: Colors.black54),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordView,
                    icon: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                obscureText: _isHidden,
                validator: validatorPassword,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    ref
                        .watch(authControllerProvider.notifier)
                        .login(
                          email: emailEditingController.text,
                          password: passwordEditingController.text,
                        )
                        .then(
                          (value) => CustomSnackbar.display(
                            context,
                            CustomSnackbar(
                              type: CustomSnackbarType.success,
                              title: L.of(context).snackbar_title_success,
                              message:
                                  L.of(context).snackbar_message_login_success,
                            ),
                          ),
                        )
                        .onError((AppException error, stackTrace) {
                      final translatedError = AppExceptionsTranslator(
                        context: context,
                        exception: error,
                      ).translate();
                      CustomSnackbar.display(
                        context,
                        CustomSnackbar(
                          type: CustomSnackbarType.error,
                          title: L.of(context).snackbar_title_error,
                          message: translatedError.message,
                          listStrings: translatedError.errors?.values.toList(),
                        ),
                      );
                    });
                  }
                },
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (ref.watch(authControllerProvider).isLoading)
                      Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    else
                      const Icon(Icons.login),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(L.of(context).form_button_login),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () {
                  const RegisterRoute().go(context);
                },
                child: Text(L.of(context).form_button_register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

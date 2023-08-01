import 'package:app/features/user/ui/forms/login_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late ConsumerStatefulWidget authForm;

    return ScreenTypeLayout.builder(
      mobile: (_) => AuthScreenSmall(),
      tablet: (_) => OrientationLayoutBuilder(
        landscape: (context) => AuthScreenMedium(),
        portrait: (context) => AuthScreenSmall(),
      ),
      desktop: (_) => AuthScreenMedium(),
    );
  }
}

class AuthScreenSmall extends ConsumerWidget {
  const AuthScreenSmall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/steve-johnson-WVUrbhWtRNM-unsplash.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthScreenMedium extends ConsumerWidget {
  const AuthScreenMedium({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1, // 20%
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/steve-johnson-WVUrbhWtRNM-unsplash.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 1, // 60%
            child: Center(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    LoginForm(),
                    // ElevatedButton(
                    //   onPressed: () => ref
                    //       .read(authControllerProvider.notifier)
                    //       .login(
                    //         'gamora@example.com',
                    //         'Pa\$\$W0rd',
                    //       )
                    //       .then((value) => CustomSnackbar.display(
                    //           context,
                    //           CustomSnackbar(
                    //             type: CustomSnackbarType.success,
                    //             title: L.of(context).snackbar_title_success,
                    //             message: L
                    //                 .of(context)
                    //                 .snackbar_message_login_success,
                    //           )))
                    //       .onError((AppException error, stackTrace) {
                    //     final translatedError = AppExceptionsTranslator(
                    //             context: context, exception: error)
                    //         .translate();
                    //     CustomSnackbar.display(
                    //         context,
                    //         CustomSnackbar(
                    //             type: CustomSnackbarType.error,
                    //             title: L.of(context).snackbar_title_error,
                    //             message: translatedError.message,
                    //             listStrings:
                    //                 translatedError.errors?.values.toList()));
                    //   }),
                    //   child: const Text('Login'),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

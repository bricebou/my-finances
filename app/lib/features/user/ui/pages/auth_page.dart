import 'package:app/features/user/ui/forms/login_form.dart';
import 'package:app/features/user/ui/forms/register_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late ConsumerStatefulWidget authForm;

    switch (type) {
      case 'login':
        authForm = const LoginForm();
        break;
      case 'register':
        authForm = const RegisterForm();
        break;
      default:
        authForm = const LoginForm();
        break;
    }

    return ScreenTypeLayout.builder(
      mobile: (_) => AuthScreenSmall(form: authForm),
      tablet: (_) => OrientationLayoutBuilder(
        landscape: (context) => AuthScreenMedium(form: authForm),
        portrait: (context) => AuthScreenSmall(form: authForm),
      ),
      desktop: (_) => AuthScreenMedium(form: authForm),
    );
  }
}

class AuthScreenSmall extends ConsumerWidget {
  const AuthScreenSmall({super.key, required this.form});

  final ConsumerStatefulWidget form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/steve-johnson-WVUrbhWtRNM-unsplash.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [form],
          ),
        ),
      ),
    );
  }
}

class AuthScreenMedium extends ConsumerWidget {
  const AuthScreenMedium({super.key, required this.form});

  final ConsumerStatefulWidget form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/steve-johnson-WVUrbhWtRNM-unsplash.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: IntrinsicHeight(
                child: Column(
                  children: [form],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

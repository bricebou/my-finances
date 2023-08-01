import 'package:app/features/main/ui/widgets/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatelessWidget {
  const MainPage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => MainPageMobile(child: child),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (context) => MainPageMobile(child: child),
        landscape: (context) => MainPageMedium(child: child),
      ),
      desktop: (_) => MainPageMedium(child: child),
    );
  }
}

class MainPageMobile extends ConsumerWidget {
  const MainPageMobile({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: CustomNavigation().bottomBar(context),
      body: Center(
        child: child,
      ),
    );
  }
}

class MainPageMedium extends ConsumerWidget {
  const MainPageMedium({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          CustomNavigation().rail(context),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}

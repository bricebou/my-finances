import 'package:app/features/budgets/ui/pages/budget_page.dart';
import 'package:app/features/budgets/ui/pages/budgets_list_page.dart';
import 'package:app/features/budgets/ui/pages/budgets_page.dart';
import 'package:app/features/main/ui/pages/main_page.dart';
import 'package:app/features/splash/ui/pages/splash_page.dart';
import 'package:app/features/user/ui/pages/auth_page.dart';
import 'package:app/features/user/ui/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> budgetsNavigatorKey =
    GlobalKey<NavigatorState>();

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedShellRoute<MainRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedShellRoute<BudgetsRoute>(
      routes: [
        TypedGoRoute<BudgetLastRoute>(path: BudgetLastRoute.path, routes: [
          TypedGoRoute<BudgetsListRoute>(path: BudgetsListRoute.path),
          TypedGoRoute<BudgetRoute>(path: BudgetRoute.path),
        ]),
      ],
    ),
    TypedGoRoute<ProfileRoute>(path: ProfileRoute.path),
  ],
)
class MainRoute extends ShellRouteData {
  const MainRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainPage(child: navigator);
  }
}

class BudgetsRoute extends ShellRouteData {
  const BudgetsRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = budgetsNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BudgetsPage(child: navigator);
  }
}

class BudgetLastRoute extends GoRouteData {
  const BudgetLastRoute();

  static const path = '/budget';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BudgetPage();
  }
}

class BudgetsListRoute extends GoRouteData {
  const BudgetsListRoute();

  static const path = 'list';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BudgetsListPage();
  }
}

class BudgetRoute extends GoRouteData {
  const BudgetRoute(this.id);

  final String id;
  static const path = ':id';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BudgetPage(
      id: id,
    );
  }
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  static const path = '/profile';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserPage();
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthPage(type: 'login');
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  static const path = '/register';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthPage(type: 'register');
  }
}

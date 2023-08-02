import 'package:app/core/router/router_listenable.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/core/storage/storage_helpers.dart';
import 'package:app/features/user/states/settings_controller.dart';
import 'package:app/l10n/generated/l10n.dart';
import 'package:app/utils/config/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferenceProvider.overrideWith((ref) => sharedPreferences)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerListenableProvider.notifier);
    final isDark = ref.watch(isDarkProvider);

    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'routerKey'));
    final router = useMemoized(
          () =>
          GoRouter(
            navigatorKey: key.value,
            refreshListenable: notifier,
            initialLocation: SplashRoute.path,
            debugLogDiagnostics: true,
            routes: $appRoutes,
            redirect: notifier.redirect,
          ),
      [notifier],
    );

    return MaterialApp.router(
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      locale: ref
          .watch(setLocaleProvider)
          .value,
      routerConfig: router,
      theme: themeDataLight,
      darkTheme: themeDataDark,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      title: 'My Finances',
    );
  }
}

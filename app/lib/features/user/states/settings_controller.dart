import 'dart:convert';
import 'dart:ui';

import 'package:app/core/storage/storage_helpers.dart';
import 'package:app/utils/config/app_locales.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class IsDark extends _$IsDark {
  @override
  bool build() {
    return ref.read(storageHelpersProvider).isDarkModeEnabled();
  }

  void toggleTheme() {
    ref.watch(storageHelpersProvider).setDarkModeEnabled(
          isDark: !ref.watch(storageHelpersProvider).isDarkModeEnabled(),
        );
    state = ref.watch(storageHelpersProvider).isDarkModeEnabled();
  }
}

@riverpod
class SetLocale extends _$SetLocale {
  @override
  Future<Locale> build() async {
    final stringLocale = ref.watch(storageHelpersProvider).isSelectedLocale();

    if (stringLocale != null) {
      final jsonLocale = await jsonDecode(stringLocale);
      return Locale.fromSubtags(
          languageCode: jsonLocale['languageCode']!.toString(),
          countryCode: jsonLocale['countryCode'].toString());
    } else {
      return defaultLocale;
    }
  }

  void setLocale(Locale locale) {
    final jsonLocale = jsonEncode({
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode
    });

    ref.watch(storageHelpersProvider).setSelectedLocale(locale: jsonLocale);

    state = AsyncData(locale);
  }
}

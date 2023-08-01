import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_helpers.g.dart';

@riverpod
SharedPreferences sharedPreference(SharedPreferenceRef ref) {
  throw UnimplementedError();
}

@riverpod
StorageHelpers storageHelpers(StorageHelpersRef ref) {
  return StorageHelpers(sharedPreferences: ref.read(sharedPreferenceProvider));
}

class StorageHelpers {
  StorageHelpers({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  String? getAuthToken() {
    return sharedPreferences.getString(PrefKeys.sharedAuthTokenKey);
  }

  void setAuthToken({required String token}) {
    sharedPreferences.setString(PrefKeys.sharedAuthTokenKey, token);
  }

  void unsetAuthToken() {
    sharedPreferences.remove(PrefKeys.sharedAuthTokenKey);
  }

  bool isDarkModeEnabled() {
    return sharedPreferences.getBool(PrefKeys.sharedDarkModeKey) ??
        ThemeMode.system.name == 'dark';
  }

  void setDarkModeEnabled({required bool isDark}) {
    sharedPreferences.setBool(PrefKeys.sharedDarkModeKey, isDark);
  }

  String? isSelectedLocale() {
    return sharedPreferences.getString(PrefKeys.sharedLanguageKey);
  }

  void setSelectedLocale({required String locale}) {
    sharedPreferences.setString(PrefKeys.sharedLanguageKey, locale);
  }
}

mixin PrefKeys {
  static const String sharedAuthTokenKey = "AuthToken";
  static const String sharedDarkModeKey = "isDarkModeEnabled";
  static const String sharedLanguageKey = "SelectedLanguage";
}

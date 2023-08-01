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
}

mixin PrefKeys {
  static const String sharedAuthTokenKey = "AuthToken";
}

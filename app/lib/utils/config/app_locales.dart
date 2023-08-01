import 'dart:ui';

const Locale defaultLocale = Locale('en', 'US');

enum SupportedLocales {
  english(Locale('en', 'US')),
  french(Locale('fr', 'FR'));

  const SupportedLocales(this.locale);

  final Locale locale;

  static List<Locale> toLocalesList() {
    return SupportedLocales.values.map((e) => e.locale).toList();
  }
}

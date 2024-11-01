import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocale {
  Future saveLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('localeCode', locale.languageCode);
  }

  Future<Locale> getSavedLocale() async {
    Locale locale;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeCode = prefs.getString('localeCode');
    if (localeCode != null) {
      locale = Locale(localeCode);
      await saveLocale(locale);
    } else {
      locale = const Locale('lt');
    }
    return locale;
  }
}

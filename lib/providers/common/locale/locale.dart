import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'locale_service.dart';

part 'locale.g.dart';

@Riverpod(keepAlive: true)
class RefLocale extends _$RefLocale {
  @override
  Locale build() {
    return const Locale('en');
  }

  Future getSavedLocale() async {
    Locale locale = await ServiceLocale().getSavedLocale();
    state = locale;
  }

  Future changeLocale(Locale locale) async {
    await ServiceLocale().saveLocale(locale);
    state = locale;
  }
}

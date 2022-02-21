// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:cryptotrack/internal/db_hive.dart';

final settings = StateNotifierProvider<SettingsNotifier, Settings>(
    (ref) => SettingsNotifier());

class Settings {
  late ThemeMode themeMode;
  late bool blackTheme;
  late Locale locale;
  late String currency;

  var box = Hive.box(BoxNames.settings);

  Settings({
    ThemeMode? themeMode,
    bool? blackTheme,
    Locale? locale,
    String? currency,
  }) {
    this.themeMode = themeMode ??
        ThemeMode.values[box.get(BoxSettings.themeMode, defaultValue: 0)];
    this.blackTheme =
        blackTheme ?? box.get(BoxSettings.blackTheme, defaultValue: false);
    this.locale =
        locale ?? Locale(box.get(BoxSettings.locale, defaultValue: 'en'));
    this.currency =
        currency ?? box.get(BoxSettings.currency, defaultValue: 'USD');
  }

  Settings copy({
    ThemeMode? themeMode,
    bool? blackTheme,
    Locale? locale,
    String? currency,
  }) =>
      Settings(
        themeMode: themeMode ?? this.themeMode,
        blackTheme: blackTheme ?? this.blackTheme,
        locale: locale ?? this.locale,
        currency: currency ?? this.currency,
      );
}

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier() : super(Settings());

  var box = Hive.box(BoxNames.settings);

  set themeMode(ThemeMode themeMode) {
    box.put(BoxSettings.themeMode, ThemeMode.values.indexOf(themeMode));
    state = state.copy(themeMode: themeMode);
  }

  set blackTheme(bool blackTheme) {
    box.put(BoxSettings.blackTheme, blackTheme);
    state = state.copy(blackTheme: blackTheme);
  }

  set locale(Locale locale) {
    box.put(BoxSettings.locale, locale.toLanguageTag());
    state = state.copy(locale: locale);
  }

  set currency(String currency) {
    box.put(BoxSettings.currency, currency);
    state = state.copy(currency: currency);
  }
}

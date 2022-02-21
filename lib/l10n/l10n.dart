// Flutter imports:
import 'package:flutter/material.dart';

class L10n {
  static const Map<String, String> languages = {
    'de': 'Deutsch',
    'en': 'English',
  };
  static const defaultLocale = Locale('en');

  static final allLocals = [
    const Locale('en'),
    const Locale('de'),
  ];
}

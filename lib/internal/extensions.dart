// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextProviders on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

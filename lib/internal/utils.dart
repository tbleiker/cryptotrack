// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';

import 'dart:async';

Future<String> getVersion() async {
  //PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //print(packageInfo.version);
  //return packageInfo.version;
  return '0.0.1';
}

String getThemeModeName(BuildContext context, ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return context.l10n.common_theme_light;
    case ThemeMode.dark:
      return context.l10n.common_theme_dark;
    case ThemeMode.system:
    default:
      return context.l10n.common_theme_system;
  }
}

Widget listSelectionTile({
  required Widget title,
  Widget? subtitle,
  required bool selected,
  required VoidCallback? onTap,
}) {
  return ListTile(
    selected: selected,
    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    title: title,
    subtitle: subtitle,
    trailing: selected ? const Icon(Icons.check) : null,
    onTap: onTap,
  );
}

Future<dynamic> showListSelection({
  required BuildContext context,
  required int itemCount,
  required IndexedWidgetBuilder itemBuilder,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      );
    },
  );
}

Future<bool> confirmAbortion(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Text(context.l10n.dialog_confirmAbortion_text),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.common_cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.common_ok),
          ),
        ],
      );
    },
  );
}

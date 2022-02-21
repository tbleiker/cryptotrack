// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:cryptotrack/internal/db_hive.dart';
import 'package:cryptotrack/internal/settings.dart';
import 'package:cryptotrack/internal/themes.dart';
import 'package:cryptotrack/l10n/l10n.dart';
import 'package:cryptotrack/views/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appSupportDir = await getApplicationSupportDirectory();

  Hive.init(appSupportDir.path);
  await Hive.openBox(BoxNames.settings);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(settings).themeMode;

    return MaterialApp(
      title: 'CoinTrack',
      theme: Themes.light,
      darkTheme: ref.watch(settings).blackTheme ? Themes.black : Themes.dark,
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.allLocals,
      locale: ref.watch(settings).locale,
      home: const MainView(),
    );
  }
}

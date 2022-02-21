// Flutter imports:
import 'package:cryptotrack/internal/entity_currencie.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/settings.dart';
import 'package:cryptotrack/internal/utils.dart';
import 'package:cryptotrack/l10n/l10n.dart';
import 'package:cryptotrack/widgets/main_body.dart';
import 'package:cryptotrack/widgets/settings_category.dart';
import 'package:cryptotrack/widgets/settings_tile.dart';

class MoreView extends ConsumerStatefulWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  _MoreView createState() => _MoreView();
}

class _MoreView extends ConsumerState<MoreView> {
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    String appVersion = await getVersion();
    setState(() {
      _appVersion = appVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      appBar: AppBar(
        title: const Text('CryptoTrack'),
      ),
      child: ListView(
        children: <Widget>[
          SettingsCategory(
            title: context.l10n.more_personalization,
            children: <Widget>[
              SettingsTile(
                icon: const Icon(Icons.language),
                title: Text(context.l10n.more_personalization_language),
                subtitle: Text(L10n.languages[
                        ref.watch(settings).locale.toLanguageTag()] ??
                    ''),
                onTap: () {
                  showListSelection(
                    context: context,
                    itemCount: L10n.languages.length,
                    itemBuilder: (context, index) {
                      final String locale = L10n.languages.keys.toList()[index];
                      final String language =
                          L10n.languages.values.toList()[index];
                      final bool selected =
                          ref.watch(settings).locale == Locale(locale);
                      return listSelectionTile(
                        title: Text(language),
                        selected: selected,
                        onTap: () {
                          ref.read(settings.notifier).locale = Locale(locale);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              ),
              SettingsTile(
                icon: const Icon(Icons.paid_outlined),
                title: Text(context.l10n.more_personalization_currency),
                subtitle: Text(ref.watch(settings).currency),
                onTap: () {
                  List<String> currencies = getCurrencies();

                  showListSelection(
                    context: context,
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      final bool selected =
                          ref.watch(settings).currency == currencies[index];
                      return listSelectionTile(
                        title: Text(currencies[index]),
                        selected: selected,
                        onTap: () {
                          ref.read(settings.notifier).currency =
                              currencies[index];
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              ),
              SettingsTile(
                icon: const Icon(Icons.visibility_outlined),
                title: Text(context.l10n.more_personalization_setTheme),
                subtitle: Text(
                    getThemeModeName(context, ref.watch(settings).themeMode)),
                onTap: () {
                  showListSelection(
                    context: context,
                    itemCount: ThemeMode.values.length,
                    itemBuilder: (context, index) {
                      final ThemeMode theme = ThemeMode.values[index];
                      final bool selected =
                          ref.watch(settings).themeMode == theme;
                      return listSelectionTile(
                        title: Text(getThemeModeName(context, theme)),
                        selected: selected,
                        onTap: () {
                          ref.read(settings.notifier).themeMode =
                              ThemeMode.values[index];
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              ),
              SettingsTile.withSwitch(
                value: ref.watch(settings).blackTheme,
                icon: const Icon(Icons.mode_night_outlined),
                title: Text(context.l10n.more_personalization_useBlackTheme),
                onChanged: (value) {
                  ref.read(settings.notifier).blackTheme = value;
                },
              ),
            ],
          ),
          SettingsCategory(
            title: context.l10n.info_title,
            children: <Widget>[
              SettingsTile(
                icon: const Icon(Icons.info_outline),
                title: Text(context.l10n.info_about),
                onTap: () {},
              ),
              SettingsTile(
                icon: const Icon(Icons.update),
                title: Text(context.l10n.info_checkUpdate),
                onTap: () {},
              ),
              SettingsTile(
                icon: const Icon(Icons.bug_report_outlined),
                title: Text(context.l10n.info_reportBug),
                onTap: () {},
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('${context.l10n.common_version} $_appVersion',
                  style: const TextStyle(fontStyle: FontStyle.italic)),
            ),
          ),
        ],
      ),
    );
  }
}

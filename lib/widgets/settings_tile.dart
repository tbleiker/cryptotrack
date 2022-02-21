// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/themes.dart';

class SettingsTile extends StatelessWidget {
  final Widget title;
  final Widget? description;
  final Widget? icon;
  final Widget? subtitle;
  final Widget? trailing;
  final bool enabled;
  final bool visible;
  final VoidCallback? onTap;

  const SettingsTile({
    Key? key,
    required this.title,
    this.description,
    this.icon,
    this.subtitle,
    this.trailing,
    this.enabled = true,
    this.visible = true,
    this.onTap,
  }) : super(key: key);

  SettingsTile.withSwitch({
    Key? key,
    required this.title,
    this.description,
    this.icon,
    this.subtitle,
    required bool value,
    ValueChanged<bool>? onChanged,
    Color? activeColor,
    this.enabled = true,
    this.visible = true,
  })  : trailing = Switch.adaptive(
          value: value,
          onChanged: enabled ? onChanged : null,
          activeColor: activeColor,
        ),
        onTap = (() => onChanged?.call(!value)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? _subtitle;

    if (subtitle != null) {
      _subtitle = DefaultTextStyle(
        style: context.theme.textTheme.subtitle2!.copyWith(
          color: context.theme.textTheme.caption!.color,
        ),
        child: subtitle!,
      );
    }

    return Visibility(
      visible: visible,
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          left: Themes.paddingMainLeft,
          right: Themes.paddingMainRight,
        ),
        leading: icon,
        title: title,
        trailing: trailing ?? _subtitle,
        subtitle: description,
        enabled: enabled,
        onTap: onTap,
      ),
    );
  }
}

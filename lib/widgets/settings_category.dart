// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/themes.dart';

class SettingsCategory extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsCategory({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20,
              bottom: 5,
              left: Themes.paddingMainLeft,
              right: Themes.paddingMainRight),
          child: titleWidget(title),
        ),
        ...children,
      ],
    );
  }

  Widget titleWidget(String text) => Builder(
        builder: (context) => Text(
          text.toUpperCase(),
          style: TextStyle(
            color: context.theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 2,
          ),
        ),
      );
}

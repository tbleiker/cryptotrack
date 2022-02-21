// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cryptotrack/internal/extensions.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardView();
}

class _DashboardView extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.dashboard_title),
      ),
      body: const Center(child: Text('...')),
    );
  }
}

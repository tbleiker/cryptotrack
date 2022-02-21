// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/utils.dart';
import 'package:cryptotrack/views/main_view.dart';

class TransactionEditView extends StatefulWidget {
  final Function(Pages) changePage;
  final int? Function() getEditID;

  const TransactionEditView(
      {Key? key, required this.changePage, required this.getEditID})
      : super(key: key);

  @override
  State<TransactionEditView> createState() => _TransactionEditView();
}

class _TransactionEditView extends State<TransactionEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle:
            context.theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 16),
        title: widget.getEditID() == null
            ? Text(context.l10n.transactions_addTransaction)
            : Text(context.l10n.transactions_editTransaction),
        leading: IconButton(
          onPressed: () async {
            if (await confirmAbortion(context)) {
              widget.changePage(Pages.wallets);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.changePage(Pages.transactions);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: const Center(child: Text('...')),
    );
  }
}

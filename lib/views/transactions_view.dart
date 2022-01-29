import 'package:flutter/material.dart';
import 'package:cryptotrack/views/main_view.dart';

class TransactionsView extends StatefulWidget {
  final Function(Pages, bool, int?) changePage;

  const TransactionsView({Key? key, required this.changePage})
      : super(key: key);

  @override
  State<TransactionsView> createState() => _TransactionsView();
}

class _TransactionsView extends State<TransactionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.changePage(Pages.editTransaction, false, null);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(child: Text('2')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cryptotrack/views/main_view.dart';

class EditTransactionView extends StatefulWidget {
  final Function(Pages) changePage;
  final int? Function() getEditID;

  const EditTransactionView(
      {Key? key, required this.changePage, required this.getEditID})
      : super(key: key);

  @override
  State<EditTransactionView> createState() => _EditTransactionView();
}

class _EditTransactionView extends State<EditTransactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.getEditID() == null
            ? const Text('Add Transactions')
            : const Text('Edit Transactions'),
        leading: IconButton(
          onPressed: () {
            widget.changePage(Pages.transactions);
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
      body: const Center(child: Text('5')),
    );
  }
}

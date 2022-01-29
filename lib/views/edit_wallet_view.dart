import 'package:flutter/material.dart';
import 'package:cryptotrack/views/main_view.dart';

class EditWalletView extends StatefulWidget {
  final void Function(Pages) changePage;
  final int? Function() getEditID;

  const EditWalletView(
      {Key? key, required this.changePage, required this.getEditID})
      : super(key: key);

  @override
  State<EditWalletView> createState() => _EditWalletView();
}

class _EditWalletView extends State<EditWalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.getEditID() == null
            ? const Text('Add Wallet')
            : const Text('Ediit Wallet'),
        leading: IconButton(
          onPressed: () {
            widget.changePage(Pages.wallets);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.changePage(Pages.wallets);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: const Center(child: Text('6')),
    );
  }
}

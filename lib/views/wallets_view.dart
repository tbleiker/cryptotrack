import 'package:flutter/material.dart';
import 'package:cryptotrack/views/main_view.dart';

class WalletsView extends StatefulWidget {
  final Function(Pages, bool, int?) changePage;

  const WalletsView({Key? key, required this.changePage}) : super(key: key);

  @override
  State<WalletsView> createState() => _WalletsView();
}

class _WalletsView extends State<WalletsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallets'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.changePage(Pages.editWallets, false, 1);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(child: Text('3')),
    );
  }
}

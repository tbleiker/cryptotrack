import 'package:flutter/material.dart';
import 'package:cryptotrack/views/dashboard_view.dart';
import 'package:cryptotrack/views/transactions_view.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key, this.selectedIndex = 0}) : super(key: key);
  final int selectedIndex;

  @override
  State<NavigationBottom> createState() => _NavigationBottom();
}

class _NavigationBottom extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.dashboard)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard)),
        ]),
      ),
    );
  }
}

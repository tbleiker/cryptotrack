import 'package:flutter/material.dart';
import 'package:cryptotrack/views/dashboard_view.dart';
import 'package:cryptotrack/views/transactions_view.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottom();
}

class _NavigationBottom extends State<NavigationBottom> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTap,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Dashbaord'),
        BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz), label: 'Transactions'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), label: 'Wallets'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cryptotrack/views/dashboard_view.dart';
import 'package:cryptotrack/views/transactions_view.dart';
import 'package:cryptotrack/views/wallets_view.dart';
import 'package:cryptotrack/views/settings_view.dart';
import 'package:cryptotrack/views/edit_transaction_view.dart';
import 'package:cryptotrack/views/edit_wallet_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainView();
}

class Page {
  final Widget body;
  final Pages navItem;
  final bool allowNav;

  Page({required this.body, required this.navItem, this.allowNav = true});
}

class NavItem {
  final Widget icon;
  final String label;
  final Pages page;

  NavItem({required this.icon, required this.label, required this.page});
}

enum Pages {
  dashbord,
  transactions,
  wallets,
  settings,
  editTransaction,
  editWallets
}

class _MainView extends State<MainView> {
  Pages _pageIndex = Pages.dashbord;
  int _navIndex = 0;
  int? _editID;
  bool _allowNav = true;

  late Map<Pages, Page> _pages;

  final _navItems = [
    NavItem(
      icon: const Icon(Icons.dashboard),
      label: 'Dashbord',
      page: Pages.dashbord,
    ),
    NavItem(
      icon: const Icon(Icons.swap_horiz),
      label: 'Transactions',
      page: Pages.transactions,
    ),
    NavItem(
      icon: const Icon(Icons.account_balance_wallet_outlined),
      label: 'Wallets',
      page: Pages.wallets,
    ),
    NavItem(
      icon: const Icon(Icons.settings),
      label: 'Settings',
      page: Pages.settings,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pages = {
      Pages.dashbord: Page(
        body: const DashboardView(),
        navItem: Pages.dashbord,
      ),
      Pages.transactions: Page(
        body: TransactionsView(changePage: changePage),
        navItem: Pages.transactions,
      ),
      Pages.wallets: Page(
        body: WalletsView(changePage: changePage),
        navItem: Pages.wallets,
      ),
      Pages.settings: Page(
        body: const SettingsView(),
        navItem: Pages.settings,
      ),
      Pages.editTransaction: Page(
        body: EditTransactionView(changePage: changePage, getEditID: getEditId),
        navItem: Pages.transactions,
        allowNav: false,
      ),
      Pages.editWallets: Page(
        body: EditWalletView(changePage: changePage, getEditID: getEditId),
        navItem: Pages.wallets,
        allowNav: false,
      ),
    };
  }

  int? getEditId() => _editID;

  void changePage(Pages page, [bool allowChangePage = true, int? id]) {
    int index = 0;

    for (var i = 0; i < _navItems.length; i++) {
      if (_navItems[i].page == _pages[page]?.navItem) {
        index = i;
        break;
      }
    }

    setState(() {
      _editID = id;
      _pageIndex = page;
      _navIndex = index;
      _allowNav = _pages[page]?.allowNav ?? true;
    });
  }

  Future<bool> _askForAbortion(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: const Text('Do you really want to abort?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _onItemTap(int index) async {
    if (_allowNav == false) {
      if (await _askForAbortion(context) == false) {
        return;
      }
    }

    setState(() {
      _allowNav = true;
      _navIndex = index;
      _pageIndex = _navItems[index].page;
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItemList() {
    return [
      for (final e in _navItems)
        BottomNavigationBarItem(
          icon: e.icon,
          label: e.label,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex]?.body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: _navIndex,
        items: _buildBottomNavigationBarItemList(),
      ),
    );
  }
}

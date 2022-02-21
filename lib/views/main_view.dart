// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:cryptotrack/internal/breakpoints.dart';
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/themes.dart';
import 'package:cryptotrack/internal/utils.dart';
import 'package:cryptotrack/views/dashboard_view.dart';
import 'package:cryptotrack/views/more_view.dart';
import 'package:cryptotrack/views/transaction_edit_view.dart';
import 'package:cryptotrack/views/transactions_view.dart';
import 'package:cryptotrack/views/wallet_edit_view.dart';
import 'package:cryptotrack/views/wallets_view.dart';

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
  more,
  editTransaction,
  editWallets
}

class _MainView extends State<MainView> {
  Pages _pageIndex = Pages.dashbord;
  int _navIndex = 0;
  int? _editID;
  bool _allowNav = true;

  late Map<Pages, Page> _pages;

  // defined in build function...
  List<NavItem> _navItems = [];

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }

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
      Pages.more: Page(
        body: const MoreView(),
        navItem: Pages.more,
      ),
      Pages.editTransaction: Page(
        body: TransactionEditView(changePage: changePage, getEditID: getEditId),
        navItem: Pages.transactions,
        allowNav: false,
      ),
      Pages.editWallets: Page(
        body: WalletEditView(changePage: changePage, getEditID: getEditId),
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

  Future<void> _onNavigationItemTap(int index) async {
    if (_allowNav == false) {
      if (await confirmAbortion(context) == false) {
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
      for (final items in _navItems)
        BottomNavigationBarItem(
          icon: items.icon,
          label: items.label,
        )
    ];
  }

  List<NavigationRailDestination> _buildNavigationRailItemList() {
    return [
      for (final items in _navItems)
        NavigationRailDestination(
          icon: items.icon,
          label: Text(items.label),
        )
    ];
  }

  Widget _buildViewNavigationBottom() {
    return Scaffold(
      key: widget.key,
      body: SafeArea(
        child: _pages[_pageIndex]!.body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavigationItemTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: _navIndex,
        items: _buildBottomNavigationBarItemList(),
      ),
    );
  }

  Widget _buildViewNavigationRail() {
    return Scaffold(
      key: widget.key,
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              destinations: _buildNavigationRailItemList(),
              selectedIndex: _navIndex,
              onDestinationSelected: _onNavigationItemTap,
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
            ),
            Expanded(
              child: _pages[_pageIndex]!.body,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            context.theme.bottomNavigationBarTheme.backgroundColor,
        statusBarColor: context.theme.appBarTheme.backgroundColor,
        statusBarBrightness: brightnessAppBar(context),
        statusBarIconBrightness: brightnessAppBar(context),
      ),
    );

    _navItems = [
      NavItem(
        icon: const Icon(Icons.trending_up),
        label: context.l10n.dashboard_title,
        page: Pages.dashbord,
      ),
      NavItem(
        icon: const Icon(Icons.swap_horiz),
        label: context.l10n.transactions_title,
        page: Pages.transactions,
      ),
      NavItem(
        icon: const Icon(Icons.account_balance_wallet_outlined),
        label: context.l10n.wallets_title,
        page: Pages.wallets,
      ),
      NavItem(
        icon: const Icon(Icons.more_horiz),
        label: context.l10n.more_title,
        page: Pages.more,
      ),
    ];

    if (MediaQuery.of(context).size.width > FormFactor.tablet) {
      return _buildViewNavigationRail();
    } else {
      return _buildViewNavigationBottom();
    }
  }
}

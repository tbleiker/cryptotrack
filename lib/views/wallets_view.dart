// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/themes.dart';
import 'package:cryptotrack/internal/entity_wallet.dart';
import 'package:cryptotrack/views/main_view.dart';
import 'package:cryptotrack/widgets/button_add.dart';
import 'package:cryptotrack/widgets/main_body.dart';
import 'package:cryptotrack/widgets/wallets_list_tile.dart';

class WalletsView extends StatefulWidget {
  final Function(Pages, bool, int?) changePage;

  const WalletsView({
    Key? key,
    required this.changePage,
  }) : super(key: key);

  @override
  State<WalletsView> createState() => _WalletsView();
}

class _WalletsView extends State<WalletsView> {
  String filter = '';

  Widget _buildWalletList() {
    List<Wallet> list = getWallets(filter: filter);

    return ListView.builder(
      padding: const EdgeInsets.only(
        left: Themes.paddingMainLeft,
        top: 20,
        right: Themes.paddingMainRight,
        bottom: 20,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final bool isFirst = index == 0 ? true : false;
        final bool isLast = index == list.length - 1 ? true : false;

        return WalletsListTile(
          wallet: list[index],
          isFirst: isFirst,
          isLast: isLast,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.wallets_title),
        actions: <Widget>[
          ButtonAdd(
            onPressed: () => widget.changePage(Pages.editWallets, false, null),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Themes.paddingMainTop,
              left: Themes.paddingMainLeft,
              right: Themes.paddingMainRight,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: context.l10n.wallets_search_hintText,
              ),
              onChanged: (value) {
                setState(() {
                  filter = value;
                });
              },
            ),
          ),
          Expanded(child: _buildWalletList()),
        ],
      ),
    );
  }
}

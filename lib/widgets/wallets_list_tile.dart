// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/entity_wallet.dart';

class WalletsListTile extends StatelessWidget {
  final Wallet wallet;
  final bool isFirst;
  final bool isLast;

  const WalletsListTile({
    Key? key,
    required this.wallet,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius top = isFirst ? const Radius.circular(20) : const Radius.circular(2);
    Radius bottom =
        isLast ? const Radius.circular(20) : const Radius.circular(2);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: top, bottom: bottom),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(wallet.name),
      ),
    );
  }
}

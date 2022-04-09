// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';
import 'package:cryptotrack/internal/themes.dart';
import 'package:cryptotrack/internal/utils.dart';
import 'package:cryptotrack/views/main_view.dart';
import 'package:cryptotrack/widgets/main_body.dart';

class WalletEditView extends StatefulWidget {
  final void Function(Pages) changePage;
  final int? Function() getEditID;

  const WalletEditView(
      {Key? key, required this.changePage, required this.getEditID})
      : super(key: key);

  @override
  State<WalletEditView> createState() => _WalletEditView();
}

class _WalletEditView extends State<WalletEditView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MainBody(
      // app bar
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle:
            context.theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 16),
        title: widget.getEditID() == null
            ? Text(context.l10n.wallets_addWallet)
            : Text(context.l10n.wallets_editWallet),
        leading: IconButton(
          onPressed: () async {
            if (await confirmAbortion(context)) {
              widget.changePage(Pages.wallets);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.changePage(Pages.wallets);
              }
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),

      // body
      child: Padding(
        padding: const EdgeInsets.only(
          top: Themes.paddingMainTop,
          left: Themes.paddingMainLeft,
          right: Themes.paddingMainRight,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Wallet Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a wallet name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Portfolio Name',
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),

          /*child: Padding(
            padding: const EdgeInsets.only(
              left: Themes.paddingMainLeft,
              right: Themes.paddingMainRight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Wallet Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: TextField(
                    mouseCursor: SystemMouseCursors.click,
                    enableInteractiveSelection: false,
                    onTap: () => {print('...')},
                    readOnly: true,
                    showCursor: false,
                    decoration: const InputDecoration(
                      hintText: 'Enter Coin Name',
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                    /*validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }*/
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: 'Where to get data',
                    ),
                    items: <String>[
                      'Coingecko',
                      'Tinyman',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField(
                        borderRadius: BorderRadius.circular(10.0),
                        isExpanded: true,
                        decoration: const InputDecoration(
                          hintText: 'Coin',
                        ),
                        items: <String>[
                          'Bitcoin',
                          'Algorand',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}

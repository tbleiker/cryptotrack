// Flutter imports:
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  final AppBar appBar;
  final Widget child;

  const MainBody({
    Key? key,
    required this.appBar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SizedBox(
          width: 800,
          child: child,
        ),
      ),
    );
  }
}

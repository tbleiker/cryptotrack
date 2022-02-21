// Flutter imports:
import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  final VoidCallback? onPressed;

  const ButtonAdd({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}

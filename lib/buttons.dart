import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  VoidCallback buttonOnPressed;

  Buttons({
    super.key,
    required this.buttonText,
    required this.buttonOnPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonOnPressed,
      child: Text(buttonText),
    );
  }
}

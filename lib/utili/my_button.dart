import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.onPress, required this.text, super.key});
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}

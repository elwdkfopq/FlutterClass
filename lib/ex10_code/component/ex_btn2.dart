import 'package:flutter/material.dart';

class PlatformLoginBtn extends StatelessWidget {
  const PlatformLoginBtn({super.key, required this.color, required this.onpress, required this.text});
  final color;
  final onpress;
  final text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color),
        onPressed: onpress,
        child: Text(text));
  }
}
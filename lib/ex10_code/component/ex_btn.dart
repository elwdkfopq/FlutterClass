import 'package:flutter/material.dart';

class LoginPageBtn extends StatelessWidget {
  const LoginPageBtn({super.key, required this.color, required this.onpress, required this.txt});
  final color;
  final onpress;
  final txt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color),
        onPressed: onpress,
        child: Text(txt));
  }
}
import 'package:flutter/material.dart';

class Ex05SwitchState extends StatefulWidget {
  const Ex05SwitchState({super.key});

  @override
  State<Ex05SwitchState> createState() => _Ex05SwitchStateState();
}

class _Ex05SwitchStateState extends State<Ex05SwitchState> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Switch(
            activeColor: Colors.red,
            value:b,
            onChanged: (v){
              setState(() {
                b = v!;
              });
              print(v);
            },
          ),
        )
    );
  }
}
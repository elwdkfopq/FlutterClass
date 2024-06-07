
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Ex02Animate extends StatelessWidget {
  const Ex02Animate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Discipline is the best tool'),
                  TypewriterAnimatedText('Design first, then code'),
                  TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                  TypewriterAnimatedText('Do not test bugs out, design them out'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
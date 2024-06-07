import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class Ex03Onboarding extends StatelessWidget {
  const Ex03Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: Text('Skip'),
        trailing: Text('Login'),
        background: [
          //double.infinity
          // (부모 위젯의 크기만큼) 가로를 꽉 채우겠다

          //MediaQuery
          //(디바이스의 크기만큼) 꽉채우겠다
          //MediaQuery.of(context).size.width -- 디바이스의 가로길이만큼...
          Image.asset('image/page1.jpg',
            width: MediaQuery.of(context).size.width,),
          Image.asset('image/page2.jpg', width: MediaQuery.of(context).size.width,),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
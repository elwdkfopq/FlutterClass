import 'package:flutter/material.dart';

class Ex05Switch extends StatefulWidget {
  const Ex05Switch({super.key});

  @override
  State<Ex05Switch> createState() => _Ex05SwitchState();
}

class _Ex05SwitchState extends State<Ex05Switch> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}








class Ex04Radio extends StatefulWidget {
  const Ex04Radio({super.key});

  @override
  State<Ex04Radio> createState() => _Ex04RadioState();
}

// 열거형 변수
// 사용법 - enum 클래스명 {변수}
enum Gender {man, woman}

class _Ex04RadioState extends State<Ex04Radio> {

  Gender g = Gender.man;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child:Column(
              children: [
                // value - radio 버튼에서 어떤 값을 가지고 있는지
                // groupValue - 값이 바뀌는 변수 (초기값으로 임의의 값지정)
                // groupValue와 value가 일치할 시 체크
                RadioListTile(
                    title:Text("남성"),
                    value: Gender.man, groupValue: g, onChanged: (value){

                  setState(() {
                    g = value!;
                  });

                  print(value);
                }),
                RadioListTile(
                    title:Text('여성'),
                    value: Gender.woman, groupValue: g, onChanged: (value){

                  setState(() {

                    g = value!;

                  });

                  print(value);

                })
              ],
            )
        )
    );
  }
}

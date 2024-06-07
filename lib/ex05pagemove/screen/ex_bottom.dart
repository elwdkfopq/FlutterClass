
import 'package:flutter/material.dart';
import 'package:flutterc/ex05pagemove/screen/ex_blue_page.dart';
import 'package:flutterc/ex05pagemove/screen/ex_green_page.dart';
import 'package:flutterc/ex05pagemove/screen/ex_red_page.dart';

class ExBottom extends StatefulWidget {
  const ExBottom({super.key});

  @override
  State<ExBottom> createState() => _ExBottomState();
}

class _ExBottomState extends State<ExBottom> {
  int select_index = 0;
  List<Widget> list_widget = [ExBluePage(),ExRedPage(),ExGreenPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottom navigation 예제'),
      ),
      body: list_widget[select_index]
      // Center(
      //   child: Text('첫번째 페이지 입니다.'),
      // )
      ,
      bottomNavigationBar:
      BottomNavigationBar(
        items: [
          // 주의사항 - item은 하나는 못씀(여러개)
          // 주의사항2 - label은 필수요소가 아니지만 반드시 써주어야 합니다.
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: ''),
        ],
        // 현재 선택된 index
        currentIndex: select_index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,

        onTap: (i){
          setState(() {
            select_index = i;
          });
        },
      ),
    );
  }
}
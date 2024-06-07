
import 'package:flutter/material.dart';
import 'package:flutterc/ex06listview/model/ryan_model.dart';


class RyanDetail extends StatelessWidget {
  const RyanDetail({super.key, required this.r});
  //model 객체를 생성하여 데이터를 보다 효율적으로 관리
  final Ryan r;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${r.index} 번째 라이언입니다'),),
      body: Center(
        child: Column(
          children: [
            Image.asset(r.imgPath),
            SizedBox(
              width: 10,
            ),
            Text(r.imgName, style: TextStyle(fontSize: 24),)


          ],
        ),
      ),
    );
  }
}
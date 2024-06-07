import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutterc/ex06listview/model/ryan_model.dart';
import 'package:flutterc/ex06listview/screen/ryan_detail_page.dart';


class ExRyanListview extends StatefulWidget {
  const ExRyanListview({super.key});

  @override
  State<ExRyanListview> createState() => _ExRyanListviewState();
}

class _ExRyanListviewState extends State<ExRyanListview> {
  var imgName = ['리틀 라이언', '반짝 라이언', '하트 라이언', '춘식이와의 만남', '룸메는 춘식이', '좋아요'];
  var imgList = [
    'image/ryan1.jpg',
    'image/ryan2.png',
    'image/ryan3.jpg',
    'image/ryan4.png',
    'image/ryan5.png',
    'image/ryan6.jpg'
  ];
  //listview에 값이 추가 되었을 때 focus 아래로 내리기
  ScrollController con = ScrollController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:
      FloatingActionButton(onPressed: () {
        //리스트 뷰에 아이템 추가
        setState(() {
          imgName.add('리틀 라이언');
          imgList.add('image/ryan1.jpg');

          //
          Timer(Duration(milliseconds: 200),(){
            con.jumpTo(con.position.maxScrollExtent);
          });

          //이동하는 애니메이션
          Timer(Duration(milliseconds: 300), () {
            con.animateTo(
              con.position.maxScrollExtent+1,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          });



        });

      },
        child: Icon(Icons.add),),
      body: SafeArea(
        child: ListView.builder(
          //scrollDirection: Axis.horizontal,// 안됨;;
          //안되는 이유 : Expanded 가로
          // ㄴ 해결방법 : Expanded를 모두 삭제
          //    ㄴ 새로운 문제점 : 이미지의 크기가 세로를 가득 채워 나옴
          //       ㄴ 해결방법 : ListView.builder의 크기 자체를 줄여줌
          //                 : ListView.builder를 SizedBox로 감싸 height값을 줌
            controller: con,
            itemCount: imgName.length,
            itemBuilder: (_, index) {

              return GestureDetector(

                onTap: (){

                  //showPopup(imgList[index], imgName[index], index);
                  // 페이지 이동 - push
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> RyanDetail(
                      r:Ryan(imgPath:imgList[index],
                          imgName:imgName[index],
                          index: index+1)

                  )));



                },

                onDoubleTap:(){
                  setState(() {
                    imgList.removeAt(index);
                    imgName.removeAt(index);
                  });

                } ,

                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.asset(imgList[index])
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(imgName[index])
                            , Text('${index + 1}번째 라이언')],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  void showPopup(image,name,index) {
    //내장함수 showDialog함수 존재
    showDialog(context: context, builder: (_){
      return Dialog(
        child: Container(

          width: MediaQuery.of(context).size.width *0.7,
          height: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image)),
              Text(name),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(onPressed: (){

                      setState(() {
                        imgList.removeAt(index);
                        imgName.removeAt(index);
                      });
                      Navigator.pop(context);


                    }, icon: Icon(Icons.close), label: Text('삭제하기'),
                        //버튼 색 바꾸는 법
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey)),
                    SizedBox(width: 10,),
                    ElevatedButton.icon(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.close), label: Text('close')),
                  ],
                ),
              )


            ],
          ),
        ),


      );

    });





  }
}



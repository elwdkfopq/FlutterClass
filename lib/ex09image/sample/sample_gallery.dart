import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Ex09image extends StatefulWidget {
  const Ex09image({super.key});

  @override
  State<Ex09image> createState() => _Ex09imageState();
}

//객체 생성
final ImagePicker picker = ImagePicker();

// 이미지 담을 수 있는 임의의 변수
XFile? pick_img;

class _Ex09imageState extends State<Ex09image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  //카메라로 촬영하기
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5)
                        ],
                      ),
                      child: IconButton(
                          onPressed: () async {
                            //source는 camera로 할것인지 gallery로 할것인 선택
                            // pub.dev에 나와 있음

                            // pick_img = await picker.pickImage(source: ImageSource.gallery);
                            pick_img = await picker.pickImage(source: ImageSource.camera);

                            setState(() {
                              ImgContainer();
                            });
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Colors.white,
                          ))),
                ],
              ),
              Container( //Image.file(File(pick_image!.path,))
                  margin: EdgeInsets.all(10),
                  //단독으로 띄우기
                  child: ImgContainer()
                // child: Image.file(File(pick_img!.path)),
              ),

            ]



            )));
  }
}

class ImgContainer extends StatelessWidget {
  const ImgContainer({super.key});

  @override
  Widget build(BuildContext context) {

    if(pick_img != null){
      return Container(
        width: 300,
        height: 300,
        child: Image.file(File(pick_img!.path)),
      );
    }else{
      return Container(
        width: 300,
        height: 300,
      );
    }

  }
}
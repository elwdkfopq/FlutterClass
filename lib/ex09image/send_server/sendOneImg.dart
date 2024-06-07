import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// final 쓰면 생략가능
final dio = Dio();

class ExSendOneImg extends StatefulWidget {
  const ExSendOneImg({super.key});

  @override
  State<ExSendOneImg> createState() => _Ex09imageState();
}

//객체 생성
final ImagePicker picker = ImagePicker();

// 이미지 담을 수 있는 임의의 변수
XFile? pick_img;

class _Ex09imageState extends State<ExSendOneImg> {
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

                  IconButton(onPressed: (){
                    oneImgSend();
                  },
                      icon: Icon(Icons.send, color: Colors.black,))
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

  void oneImgSend() async{
    // 데이터 보내주기 --> 통신 --> http/dio
    String url = "http://211.105.164.253:8085/img/upload";

    // 전송하고 싶은 데이터를 form 구조로 작성
    //map으로 작성
    FormData data = FormData.fromMap(
        {
          //test용으로 String 하나 보내주기
          "test" : "test1",
          //dio 라이브러리를 이용하여 file을 보내줄 예정
          //MultipartFile.fromFile(이미지 경로) 사용하여 파일의 경로를 전송
          "image" : await MultipartFile.fromFile(pick_img!.path, filename: pick_img!.name)
        }
    );

    Response res = await dio.post(url,data:data);
    print(res.realUri);
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


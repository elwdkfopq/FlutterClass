import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExMultiGallery extends StatefulWidget {
  const ExMultiGallery({super.key});

  @override
  State<ExMultiGallery> createState() => _ExMultiGalleryState();
}

// 갤러리 혹은 카메라 접근을 위한 객체 생성
final ImagePicker picker = ImagePicker();
// 데이터 관리를 위한 List 타입 생성
List<XFile?> img_list = [];
// 임시로 이미지들!을 담을 변수 생성
List<XFile?> pick_imgs = [];

class _ExMultiGalleryState extends State<ExMultiGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(5),
                      // color.withOpacity는 투명도
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 5)
                      ]),
                  child: IconButton(
                    onPressed: () async {
                      pick_imgs =
                      await picker.pickMultiImage();

                      // 이미지 선택을 하지 않았을 때 null 오류 해결
                      if (pick_imgs != null) {
                        setState(() {
                          img_list.addAll(pick_imgs);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder
              // count사용
                (
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3 // 1개 행에 보여질 개수
                    ,
                    childAspectRatio: 1 / 1, // 가로 세로 길이의 비율    가로/세로
                    mainAxisSpacing: 10, // 수평 패딩
                    crossAxisSpacing: 10, //  수직 패딩
                  ),
                  itemCount: img_list.length,
                  itemBuilder: (context, index) {
                    // 화면 꾸미기
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                //container에 이미지가 올 시 꾸미기 가능하게 만드는 위젯
                                  image: //XFile을 이미지로 edcoding 작업,
                                  FileImage(
                                      File(img_list[index]!.path)),
                                  fit: BoxFit.cover)),
                        ),
                        // 이미지 삭제를 위한 x표시가 그려진 container
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                            onPressed: () {

                              setState(() {
                                img_list.removeAt(index);
                              });

                            },
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
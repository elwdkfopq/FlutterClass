
import 'package:flutter/material.dart';
import 'package:flutterc/ex10_code/controller/react_controller.dart';
import 'package:get/get.dart';

class RxButton extends StatelessWidget {
  const RxButton({super.key});

  @override
  Widget build(BuildContext context) {
    print('build in method');
    //di 의존성 주입
    // ReactController controller =  Get.put(ReactController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'react getx controller',
                style: TextStyle(fontSize: 32),
              ),
              //find - controller의 의존성 주입이 필요 없어지는 함수

              //1. GetX 와 find함수 사용 -> builder find<컨트롤러 작성>().변수
              GetX(
                  init: ReactController(),
                  builder: (_)=>Text('${Get.find<ReactController>().num1}')),

              //2.Obx 와 find함수 사용
              Obx(() => Text('${Get.find<ReactController>().num1}')),


              // GetBuilder<ReactController>(
              //   builder: (context) {
              //     return Text('${controller.num1}');
              //   }
              // ),
              ElevatedButton(onPressed: () {
                print("react button click");
                // controller.increaseNum1();
                Get.find<ReactController>().increaseNum1();
              }, child: Text('증가'))
            ],
          ),
        ),
      ),
    );
  }
}
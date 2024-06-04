import 'package:get/get.dart';


class ReactController extends GetxController{
  //1. controller 클래스 생성, 변수나 메소드 생성 -> extends GetxController(x는 소문자)

  //2. .obs 사용 -> update()메소드 대신에 사용
  // 상태가 변화될 변수!에 사용
  //obs를 사용해주기 위해서는 Rx타입으로 변환
  //Rx타입은 getx에서 만든 타입 react의 약자로 즉각적으로 반응하는 변수
  RxInt num1 = 0.obs;


  //메소드
  void increaseNum1(){
    num1++;
  }
}


import 'package:get/get.dart';

class SimpleController extends GetxController{
  //1. controller 클래스 생성, 변수나 메소드 생성 -> extends GetxController(x는 소문자)

  //상태가 변할 변수/메소드
  //상태가 변할 변수1개,
  int _num1 = 0;

  //getter - dart에서 get메소드 만드는법
  // 문법: 반환타입 get 메소드명 => 리턴 변수
  int get num1 => _num1;

  //setter
  // 문법: set 메소드명(매개변수) {this.변수명 = 매개변수명}
  set num1(int num1) => this._num1= num1;
  //
  // 상태변화(숫자가 1씩 증가)하는 메소드
  void increaseNum1(){
    _num1++;
    //2. update 메소드 호출
    update();
    // 단점: 모든 컨트롤러?/메소드마다 update() 메소드 호출
  }
}
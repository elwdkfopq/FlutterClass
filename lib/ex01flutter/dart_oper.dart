void main(){

  //연산자
  // 산술 연산자
  // + - * / %

  // ~/ -- 몫 연산자
  int num1 = 10;
  int num2 = 7;

  print(num1 ~/ num2);

  // / - 나누기 연산자( 결과값이 double 반환)
  double result = num1 / num2;
  print(result);


  // 논리 연산자
  // &&, \\, !


  // 비교 연산자
  // ==(같다) !=(같지않다) <, >, <=, >=


  // 복학 대입연산자
  // +=, -=, *=  (a+=3) == (a = a+3)
  // 나누기 연산자 - double 리턴
  double num4 = 7;
  num4/=2;  // int로 하면 안됨


  // 증감 연산자(단항연산자) ++, ==
  // ++전위 연산자 후위 연산자
  // ++변수, 변수++


  // 삼항 연상자
  // 연산 ? 참일경우 : 거짓일 경우

  int num5 = 10;
  int num6 = 7;

  (num5>num6) ? print("$num5 가 큽니다") : print("$num6이 더 큽니다.");


  // casting - 형변환

  int num7 = 10;
  String s4 = "20";
  double d3 = 3.14;

  // 숫자형이 아닌 서로 다른 형을 연산하는 것은 불가능
  // print(s4 + num7);
  // 다른 형끼리는 연산 가능
  print(s4 + "world");
  //int.parse(문자형)
  print(num7 + int.parse(s4));

  // String -> double
  // double.parse(문자형)
  print(d3 + double.parse(s4));

  //int, double-> string
  //.toString()
  print(num7.toString() + s4);








}
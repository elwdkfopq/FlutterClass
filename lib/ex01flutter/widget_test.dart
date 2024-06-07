// 다트언어도 main에서 실행

void main() {
  // 메인메소드

  // 1. 변수
  //dart 언어의 타입
  //정수형 - int
  //실수형 - double
  //논리형 - bool
  //문자열 - String
  //숫자형 - num (실수, 정수 모두 포함 - 상위호환)


  int i = 10;
  //print();
  print(i);
  double d = 3.14;
  print(d);

  bool b = true;
  print(b);

  String s = "안녕하세요";

  //'',"" 구분없이 사용 가능
  //여기도 상관 없어요
  String s2 = 'hello';

  //삼중따옴표. 개행 그대로.
  String s3 = """안녕
  만나서 반가워
  내이름은 플러터야
  """;
  print(s);
  print(s3);

  //자동정렬: ctrl + alt + l

  //num 타입
  num n2 = 10;
  print(n2);
  n2 = 3.14;
  print(n2);

  // var 타입 존재 - js
  //어떠한 자료형도 다 들어갈 수 있음
  // 한번 자료형이 정해지면 타입 변경 X
  var v = "world";
  // v = 3; // 못바꿈

  // var 타입과 유사한 dynamic 타입 존재 -- C#
  // 자료형이 정해져도 바꿀 수 있습니다!
  dynamic d1 = 10;
  d1 = "안녕";
  d1 = 3.14;

  // var, dynamic이 있는데 int, String 써야하나?
  // 상관없다 단, 타입에 대한 명확한 정의가 있어야 코드관리, 협업 도움


  // 포매팅 - $
  String name = "flutter";
  int version = 3;
  print("$name의 버전은 $version 입니다.");

  // 포매팅에서 수식이 있는 경우 예 - version+1
  // $뒤에 중괄호로 감싸주기
  print("$name의 버전은 ${version+1} 입니다.");



}
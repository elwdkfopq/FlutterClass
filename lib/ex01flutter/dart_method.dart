void main(){
  add1();

  add2(10,11);

  print(add3());

  print(add4(10,11));
}

// 리턴타입 메소드명(매개변수){
//
// return
// }

//1. 리턴타입 X, 매개변수X
void add1(){
  print(21);
}

// 2. 리턴타입X, 매개변수 O
void add2(int num1, num2){ // 매개변수 타입을 안적어도 됩니다! 하지만 적는거 추천
  print(num1 + num2);
}

// 3. 리턴타입O, 매개변수 X
int add3(){// return int
  return 21;
}

// 4, 리텅타입O, 매개변수 O
int add4(num1, num2){
  return num1+num2;
}
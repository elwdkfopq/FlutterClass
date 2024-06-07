void main(){
  // while, do- while, for, for-in

  // while(조건식)
  while(true){
    int i = 10;
    print(i);
    i++;

    if(i>13){
      break;
    }
  }

  // do - while 최초 한번 실행 후 반복 조건 확인

  do{
    int i = 10;
    i++;
    if(i>20){
      break;
    }
  }while(true);

  //for문
  for(int i = 0; i<10; i++){
    print(i);
  }

  // for - in문

  // for i in [1,2,3,4,5]
  for( int i in [1,2,3,4,5]){
    print(i);
  }
}
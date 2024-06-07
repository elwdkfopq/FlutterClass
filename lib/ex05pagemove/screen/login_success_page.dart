import 'package:flutter/material.dart';

class ExLoginSuccessPage extends StatelessWidget {
  const ExLoginSuccessPage({super.key, required this.id});
  final String id;

  // const를 지우거나 속성?에 final을 써주면 되는데 final 써주는게 더 메모리적으로 좋음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('님 환영합니다'),
        backgroundColor: Colors.purpleAccent,
      ),

    );
  }
// 1. const 지워주기
// ㄴ const 컴파일 할 때 상수로 만드는것
//    ㄴ 컴파일: 작성시 에러?
// 2. 필드에 final
// ㄴ final 런타임 할 때 상수로 만드는 것
//    ㄴ 런타임: 실행시 에러?

//2번 선택 이유: const 재시작을 하지 않는한 값이 바뀌지 않습니다.
//        ㄴ 컴퓨터 입장에서 메모리 관리가 수월(리소스 낭비 방지)
}

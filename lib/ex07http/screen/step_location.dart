import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ExLocation extends StatelessWidget {
  const ExLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            // 내 위치
            getLocation();
          },
          child: Text('내위치'),
        ),
      ),
    );
  }
}


void getLocation() async{
  // await 걸어준 이유: permission 진행 때(버튼 클릭) 대기
  // 실행을 할건데 권한 받은 후에 실행
  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  print(position);
  print("lon:  ${position.longitude}");
  print("lat: ${position.latitude}");
}

import 'package:flutter/material.dart';
import 'package:flutterc/ex07http/model/sampleModel.dart';
import 'package:http/http.dart';

class EXWeather extends StatelessWidget {
  const EXWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:ElevatedButton(
            onPressed: (){
              getWeather();
            },
            child: Text('날씨 가지고 오기'),
          )
      ),
    );
  }
}

void getWeather()async{
  String url = "https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1";
  Response res = await get(Uri.parse(url));
  print(res.body);

  Sample s = sampleFromJson(res.body);
  print(s.name); // London
}
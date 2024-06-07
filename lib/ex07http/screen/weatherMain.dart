
import 'package:flutter/material.dart';
import 'package:flutterc/ex07http/model/weatherModel.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({super.key, required this.wm});
  final WeatherModel wm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,

      ),
      body: Container(
          color: Colors.lightBlue[100],
          padding: EdgeInsets.all(12),

          child: Column(
              children:[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(wm.name, style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.bold
                    ),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${wm.main.temp}도',style: TextStyle(fontSize: 38, color: Colors.red),),
                        //DateFormat 사용하여 지금 현재 날짜와 시간을 알아오기
                        // y-연도 (예 - yyyy 연도 2024 yy 24)
                        // M -월
                        // d - 일
                        // H - 시간
                        // m - 분
                        // s - 초
                        Text(DateFormat('yy년 MM월 dd일').format(DateTime.now()),style: TextStyle(fontSize: 20)),
                        //Text(DateFormat('yy년 MM월 dd일').format(DateTime.now()),style: TextStyle(fontSize: 20)),

                        //시간 표시 Timer Builder 라이브러리
                        TimerBuilder.periodic(Duration(seconds: 1),
                            builder: (context) {
                              return Text(DateFormat('HH:mm:ss').format(DateTime.now()));
                            }
                        )

                      ],
                    ),

                  ],
                ),

                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.network(''),
                            //Icon(Icons.sunny),
                            Text('${wm.weather[0].main}')
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: double.infinity,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(24),
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.water_drop_outlined, size: 40,),
                            ),
                            Text('현재 습도')
                          ],),
                      ),
                      Container( width: 1,
                        height: double.infinity,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(24),),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.wind_power, size: 40,),
                            ),
                            Text('현재 풍속'),

                          ],
                        ),
                      ),
                    ],

                  ),
                )
              ]

          )
      ),

    );
  }
}
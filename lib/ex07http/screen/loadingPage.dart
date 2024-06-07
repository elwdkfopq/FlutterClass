
import 'package:flutter/material.dart';
import 'package:flutterc/ex07http/model/weatherModel.dart';
import 'package:flutterc/ex07http/screen/weatherMain.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

double? lat;
double? lon;


class LoadingPage extends StatefulWidget  {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}


class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    // await 걸어준 이유: permission 진행(버튼 클릭) 대기
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // print(position);
    // print("lon:  ${position.longitude}");
    // print("lat: ${position.latitude}");
    lat = position.latitude;
    lon = position.longitude;

    getWeather();
  }

  void getWeather() async{
    String _apiKey = "9270d4b9a6e4ea687ab835cb5f34e4e7";
    String url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric";
    Response res = await get(Uri.parse(url));
    print(res.body);

    WeatherModel wm = weatherModelFromJson(res.body);
    print(wm.name);

    if(res.statusCode == 200){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WeatherMain(wm: wm)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlue[100],
        child: Center(
          child: Container(
            child: CircularProgressIndicator(

            ),
          ),
        ),
      ),
    );
  }
}
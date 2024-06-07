import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ExGetImg extends StatelessWidget {
  const ExGetImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Image.network
        // 접속할 때 마다 필요한 사진을 서버에 접속을 해서 불러옴
        // bbq 먹을라고 클릭해서 화면이동했는데 갑자기 bhc 먹고 싶어서 화면을 이전페이지로 이동하게 되면
        // 모든 이미지들을 다시 불러와야 합니다

        //많은 이미지 처리시간 문제
        child: Column(
            children: [
              Image.network("http://211.105.164.253:8085/static/1000000035.gif", width:200, height: 200,),

              // 처음에는 다소 느리게 로딩될 수 있습니다
              // 처음
              CachedNetworkImage(imageUrl: "http://211.105.164.253:8085/static/1000000035.gif",
                width: 200,
                height: 200,
                placeholder: (context, url)=> CircularProgressIndicator(),
                errorWidget: (context,url, error) => Icon(Icons.error),)
            ])

        ,
      ),

    );
  }
}
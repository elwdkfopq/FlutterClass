import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterc/ex08db/model/memberModel.dart';
import 'package:flutterc/ex08db/screen/join_page.dart';
import 'package:flutterc/ex08db/screen/login_success.dart';


FlutterSecureStorage storage = FlutterSecureStorage();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    readMemberInfo();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCon = TextEditingController();
    TextEditingController pwCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 페이지'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailCon,
                    decoration: InputDecoration(
                        label: Row(
                          children: [
                            Icon(Icons.account_circle),
                            Text("email 입력 "),
                          ],
                        ),
                        hintText: "example@example.com",
                        hintStyle: TextStyle(color: Colors.grey[300])),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      obscureText: true,
                      controller: pwCon,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            Icon(Icons.key),
                            Text("pw 입력 "),
                          ],
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {

                          login(emailCon.text, pwCon.text,context);



                        },
                        child: Text('로그인하기')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>JoinPage()));
                        },
                        child: Text('회원가입하기'))
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 2,
                ),
                SizedBox(
                  height: 40,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String id,String pw,context) async{

    //통신을 위해 dio 라이브러리
    // 객체생성
    Dio dio = Dio();
    String url = "http://211.105.164.253:8085/member/login";
    Response res = await dio.get(url, queryParameters: {"id":id, "pw":pw});

    // 확인
    print(res.realUri);

    if(res.statusCode == 200){


      //이동
      if(res.data== '[]'){
        print('로그인 실패');
      }else{
        print('로그인 성공');
        // storage에 write 하기
        //key값은 login
        await storage.write(key: 'login', value: res.data);

        List<MemberModel> memberList = memberModelFromJson(res.data);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginSuccessPage(mm: memberList[0])));

      }

    }
  }

  void readMemberInfo() async{

    //읽어 오기
    // 읽어 올 데이터는 회원의 정보
    // 저장할때 login이라는 key값으로 저장
    dynamic value = await storage.read(key: 'login');

    var member = memberModelFromJson(value);

    if(member != null){
      print('로그인 성공');
      // 페이지 이동
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> LoginSuccessPage(mm: member[0])), (route) => false);
    }else{
      print('로그인 실패');
    }



  }
}
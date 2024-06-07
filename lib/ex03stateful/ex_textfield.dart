import 'package:flutter/material.dart';

class Ex07Login extends StatefulWidget {
  const Ex07Login({super.key});

  @override
  State<Ex07Login> createState() => _Ex07LoginState();
}

class _Ex07LoginState extends State<Ex07Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Center(
            child: Text('로그인 화면', style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      // onpressed나 ontap 등 제스쳐 기능을 가지고 있지 않는 위젯들에게
      // 제스쳐 기능을 부여해주는 위젯
      // GestureDetector
      body:GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('image/littleryan.gif'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text('email 입력'),
                        hintText: "example@example.com",
                        hintStyle: TextStyle(color: Colors.grey[300])
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text('비밀번호 입력')
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text('로그인하기'))

              ],
            ),
          ),
        ),
      ) ,
    );
  }
}










class Ex06Textfield extends StatefulWidget {
  const Ex06Textfield({super.key});

  @override
  State<Ex06Textfield> createState() => _Ex06TextfieldState();
}
// 변수
String s = '';
class _Ex06TextfieldState extends State<Ex06Textfield> {
  @override
  Widget build(BuildContext context) {
    // 값이 바뀌는 것을 감지하는 클래스
    //textfield의 값을 가지고 오기 위해 controller 객체 생성 이후
    // textfield의 controller 요소 연결
    TextEditingController emailCon = TextEditingController();

    //textfield 하나당 하나의 컨트롤러
    TextEditingController pwCon = TextEditingController();




    return Scaffold(
        body:SafeArea(
          child: Column(
            children: [
              TextField(
                controller: emailCon,  // controller 연결
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "example@example.com",
                    hintStyle: TextStyle(color: Colors.grey[300],fontWeight: FontWeight.w200),
                    label: Row(
                      children: [
                        Icon(Icons.account_circle),
                        Text('email'),
                      ],
                    )
                ),
              ),
              TextField(
                controller: pwCon,
                decoration: InputDecoration(
                    label: Row(
                      children: [
                        Icon(Icons.key),
                        Text('password')
                      ],
                    )
                ),
                keyboardType: TextInputType.text,
                // 비밀번호처럼 보이는 설정
                obscureText: true,
              ),
              ElevatedButton(onPressed: (){
                // controller.text
                print(emailCon.text);
                setState(() {
                  s = emailCon.text;
                });

              }, child: Text('로그인')),
              SizedBox(height: 50,),
              Text('$s')
            ],
          ),
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutterc/ex05pagemove/screen/login_success_page.dart';

class ExLogin extends StatelessWidget {
  ExLogin({super.key});

  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children:[
            TextField(
              controller: emailCon,
              decoration:
              InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordCon,
              decoration:
              InputDecoration(labelText: 'PW'),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            SizedBox(
              height: 40.0,
            ),
            ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: FloatingActionButton(

                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {

                      //아이디 패스워드 일치여부
                      //id flutter pw 1234이면 로그인 성공
                      if(emailCon.text == "flutter" && passwordCon.text == '1234'){
                        // push
                        Navigator.push(context,MaterialPageRoute(builder: (_)=> ExLoginSuccessPage(id: emailCon.text,)));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("로그인 정보가 틀렸습니다"))
                        );
                      }


                    })),
          ],
        ),
      ),
    );
  }
}
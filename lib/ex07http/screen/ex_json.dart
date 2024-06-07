
import 'package:flutter/material.dart';
import 'package:flutterc/ex07http/model/user_Model.dart';
import 'package:http/http.dart';

class ExJson extends StatefulWidget {
  const ExJson({super.key});

  @override
  State<ExJson> createState() => _ExJsonState();
}

class _ExJsonState extends State<ExJson> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getInfo() async {
    //get- post방식 사용해서 데이터 파싱 가능!
    // ㄴ http 라이브러리에서 가능
    //(http에 있는)get 메소드는 return 타입이 Future<Response>
    //최초는 future 객체로 받은 후 응답이 완료 되면 Response 로 변환

    //1. http 라이브러리에 있는 get 메소드를 사용하여 데이터 파싱
    // get(Uri.parse(주소))  --> Future<Response>
    //2. Response 값 받아주기
    //3. res.body 값 가지고 오기 --> String 타입
    //4. 데이터 변환 String -> json(정확히는 model-> 더정확히는 UserModel)
    //5. http://app.quicktype.id/ 사이트에서 json 데이터 넣어 model 만들기
    //6. 사이트에서 만들어준 모델 복붙!
    //7. String -> Model변환
    //    ㄴ model.dart 에 있는 모델명fromjson(String) 함수 사용
    //    ㄴ 모델명fromjson(res.body)
    Response res =
    await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    print(res.statusCode); // 200 - 성공, 404 - 주소오류, 500- 서버오류

    print(res.body); //String 타입
    //k:v 로 이루어진 값
    //json 파싱을 통해 넘어 온 String -> 변환
    userList = userModelFromJson(res.body);
    print(userList[0].name);
    print(userList[0].address.city);

    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
                future: getInfo().then((value) => userList = value),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          UserModel user = userList[index];
                          print('${user.name} + $index');
                          return ListTile(
                            title: Text(user.name),
                            leading: Icon(Icons.account_circle),
                            subtitle: Text(user.address.city),
                            trailing: Icon(Icons.phone_android),
                          );
                        });
                  }
                })));
  }
}
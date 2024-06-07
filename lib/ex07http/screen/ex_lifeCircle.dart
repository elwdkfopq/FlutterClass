import 'package:flutter/material.dart';

class ExLife extends StatefulWidget {
  // stateful로 만들어진 이유
  // stateful에만 initstate가 존재. 상태변화가 없어도 생명주기를 사용하려면? stateful로 만들어야한다
  const ExLife({super.key});

  @override
  State<ExLife> createState() => _ExLifeState();
}

class _ExLifeState extends State<ExLife> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('fist init method');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('first dispose method');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> ExLifeSecond()));
          },
          child: Text('next'),
        ),
      ),
    );
  }
}

class ExLifeSecond extends StatefulWidget {
  const ExLifeSecond({super.key});

  @override
  State<ExLifeSecond> createState() => _ExLifeSecondState();
}

class _ExLifeSecondState extends State<ExLifeSecond> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('second init method');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('second dispose method');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}
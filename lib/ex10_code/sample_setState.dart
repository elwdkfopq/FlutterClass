import 'package:flutter/material.dart';

// setState의 비효율성 보기
class ExButton extends StatefulWidget {
  const ExButton({super.key});

  @override
  State<ExButton> createState() => _ExButtonState();
}

class _ExButtonState extends State<ExButton> {
  int plus =0;
  int minus=0;
  @override
  Widget build(BuildContext context) {
    print('build method');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('plus point $plus'),
                  SizedBox(width: 20,),
                  Text('minus point $minus')
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      print('pressed plus button');
                      increase();
                    });

                  }, child: Text('증가')),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      print('pressed minus button');
                      decrease();
                    });

                  }, child: Text('감소')),
                ],
              ),

              Text('total score ${plus + minus}')
            ],
          ),
        ),
      ),
    );
  }

  int increase()=>plus++;
  int decrease() =>minus--;
}
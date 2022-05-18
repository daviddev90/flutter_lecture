import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('네이버 메일'),
        ),
        body: Center(
            child: GestureDetector(
                onTap: () => {_showDialog(context)},
                child: const Text('Hello world'))));
  }

  // --functions
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, //종료버튼 눌러야만 종료
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('페이지 이동'),
            content: const Text('아래 버튼을 누르면 페이지를 이동합니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.pushNamed(context, '/2nd');
                  },
                  child: const Text('이동'))
            ],
          );
        });
  }
}

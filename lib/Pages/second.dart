import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('2번째 페이지입니다.'),
      ),
    );
  }
}

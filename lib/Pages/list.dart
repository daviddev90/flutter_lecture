import 'package:flutter/material.dart';
import 'package:flutter_lecture/Pages/card.dart';
import 'package:flutter_lecture/Pages/pikachu.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pikachu(),
                      ));
                },
                child: const Text('피카츄 보러 가기')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardPage(),
                      ));
                },
                child: const Text('이순신 카드 보러 가기'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 150,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 160,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 150,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

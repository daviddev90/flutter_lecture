import 'package:flutter/material.dart';
import 'package:flutter_lecture/Pages/second.dart';
import 'package:flutter_lecture/home.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Home(),
        '/2nd': (context) => const SecondPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_lecture/Pages/received.dart';
import 'package:flutter_lecture/Pages/sent.dart';
import 'package:flutter_lecture/home.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Home(),
        '/received': (context) => const Received(),
        '/sent': (context) => const Sent(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

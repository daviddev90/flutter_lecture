import 'package:flutter/material.dart';
import 'package:flutter_lecture/Pages/screen.dart';
import 'package:flutter_lecture/Pages/received.dart';
import 'package:flutter_lecture/Pages/sent.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Screen(),
        '/received': (context) => const Received(),
        '/sent': (context) => const Sent(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

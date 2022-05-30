import 'package:flutter/material.dart';
import 'package:flutter_lecture/home.dart';
import 'package:flutter_lecture/insert.dart';
import 'package:flutter_lecture/register.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const RegisterPage(),
        '/insert': (context) => const InsertPage()
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_lecture/books/01.dart';
import 'package:flutter_lecture/books/02.dart';
import 'package:flutter_lecture/books/03.dart';
import 'package:flutter_lecture/books/04.dart';
import 'package:flutter_lecture/books/05.dart';
import 'package:flutter_lecture/books/06.dart';
import 'package:flutter_lecture/books/07.dart';
import 'package:flutter_lecture/books/08.dart';
import 'package:flutter_lecture/books/09.dart';
import 'package:flutter_lecture/home.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Home(),
        '/01': (context) => const PushUpPage(),
        '/02': (context) => const Page02(),
        '/03': (context) => const Page03(),
        '/04': (context) => const Page04(),
        '/05': (context) => const Page05(),
        '/06': (context) => const Page06(),
        '/07': (context) => const Page07(),
        '/08': (context) => const Page08(),
        '/09': (context) => const Page09(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

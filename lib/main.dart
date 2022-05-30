import 'package:flutter/material.dart';
import 'package:flutter_lecture/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '개쩌는 앱',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

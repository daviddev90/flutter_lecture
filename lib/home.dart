import 'package:flutter/material.dart';
import 'package:flutter_lecture/Pages/screen.dart';
import 'package:flutter_lecture/Pages/screen1st.dart';
import 'package:flutter_lecture/Pages/screen2nd.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Screen(),
        '/1st': (context) => const Screen1st(),
        '/2nd': (context) => const Screen2nd(),
      },
      initialRoute: '/',
    );
  }
}

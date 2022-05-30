import 'package:flutter/material.dart';
import 'package:flutter_lecture/tree.dart';
import 'package:mysql1/mysql1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'qwer1234',
      db: 'education');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 32,
            ),
            TreeWgt(boxHeight: 200, treeGrowth: 50, weather: 'sunny'),
          ],
        ),
      ),
    );
  }
}

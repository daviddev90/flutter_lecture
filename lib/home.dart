import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String strr;
  late int idx;
  late String target;

  @override
  void initState() {
    super.initState();
    target = '';
    strr = '';
    idx = 0;

    Timer.periodic(const Duration(milliseconds: 150), (Timer timer){
      setState(() {
        idx++;
        strr = (target).substring(0,(idx%target.length + 1));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink
              ),
              child: Center(
              child: Text('hi'),
            )),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(onChanged: (value) {
          setState(() {
              target = value;
          });
        },  
        decoration: const InputDecoration(
          labelText: '글귀를 입력하세요'
        ),
        ),
            ),
          ],
        )
      ),
        appBar: AppBar(
          title: const Text('전광판'),
        ),
        body: Center(
          child: Text(strr,
          style: const TextStyle(
            fontSize: 25,
          ),),
        )
      );
  }
}

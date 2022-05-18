import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late bool switchValue;
  late Color btnColor;

  @override
  void initState() {
    switchValue = false;
    btnColor = Colors.red;
    super.initState();
  }

  void changeSwitchState() {
    setState(() {
      switchValue = !switchValue;
      if (switchValue) {
        btnColor = Colors.blue;
      } else {
        btnColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                changeSwitchState();
              },
              style: ElevatedButton.styleFrom(primary: btnColor),
              child: const Text('Flutter')),
          const SizedBox(
            height: 30,
          ),
          Switch(
              value: switchValue,
              //switchValue: 화면에 보이는 value
              onChanged: (value) {
                changeSwitchState();
              }),
        ],
      )),
    );
  }
}

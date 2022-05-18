import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Icon'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.add_alarm)),
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.add_outlined)),
          GestureDetector(
            onTap: (() {
              print('hello');
            }),
            child: Image.asset(
              'images/smile.png',
              width: 28,
              height: 28,
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}

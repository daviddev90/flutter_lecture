import 'package:flutter/material.dart';
import 'package:flutter_lecture/snackbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          MySnackBar(Colors.red),
          MySnackBar(Colors.blue),
          MySnackBar(Colors.purple)
        ],
      ),
    );
  }
}

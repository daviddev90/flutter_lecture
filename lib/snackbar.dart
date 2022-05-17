import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final Color? myColor;

  const MySnackBar(this.myColor);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                'Hello World',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 1),
              backgroundColor: myColor));
        },
        style: ElevatedButton.styleFrom(primary: myColor),
        child: const Text(
          'Call Snackbar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

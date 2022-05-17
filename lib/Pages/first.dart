import 'package:flutter/material.dart';
import 'package:flutter_lecture/Pages/second.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Second(),
                  ));
            },
            child: const Text('Go to second page')),
      ),
    );
  }
}

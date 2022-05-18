import 'package:flutter/material.dart';

class Sent extends StatelessWidget {
  const Sent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('보낸 메일함'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 48, 12, 48),
        child: Column(
          children: const [
            Text('상아에게 보낸 메일'),
            Text('상어에게 보낸 메일'),
            Text('성아에게 보낸 메일'),
          ],
        ),
      ),
    );
  }
}

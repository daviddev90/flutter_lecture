import 'package:flutter/material.dart';

class CalPage extends StatefulWidget {
  const CalPage({Key? key}) : super(key: key);

  @override
  State<CalPage> createState() => _CalPageState();
}

class _CalPageState extends State<CalPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Comming Soon!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

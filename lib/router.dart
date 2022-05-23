import 'package:flutter/material.dart';
import 'package:flutter_lecture/detail_list.dart';
import 'package:flutter_lecture/insert_list.dart';
import 'package:flutter_lecture/table_list.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const TableList(),
        '/insert': (context) => const InsertList(),
        '/detail': (context) => const DetailList(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

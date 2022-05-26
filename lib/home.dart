import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    _getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HI'),
      ),
      body: Center(
        child: data.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, idx) {
                  return Card(
                    child: Text(data[idx]['code']),
                  );
                }),
      ),
    );
  }

  //function
  Future<bool> _getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/student2.json');
    var response = await http.get(url);

    var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      data = result;
    });
    return true;
  }
}

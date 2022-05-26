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
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 4),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            children: ['Code', 'Name', 'Dept', 'Phone']
                                .map(
                                  (e) => Row(
                                    children: [
                                      Text(
                                        e,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(data[idx][e.toLowerCase()]),
                                    ],
                                  ),
                                )
                                .toList()),
                      ),
                    ),
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
      data.addAll(result);
    });
    return true;
  }
}

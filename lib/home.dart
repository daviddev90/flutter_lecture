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
        title: const Text('JSON Movie'),
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
                      child: Row(
                        children: [
                          Image.network(data[idx]['image'], width: 60),
                          const SizedBox(width: 20),
                          Text(data[idx]['title'])
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }

  //function
  Future<bool> _getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);

    var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      data.addAll(result);
    });
    return true;
  }
}

import 'dart:convert';
import 'dart:math';

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
                  double rnd = Random().nextDouble() * 30 + 10;
                  return Card(
                    color: const Color.fromRGBO(255, 255, 255, 0),
                    child: idx % 2 == 0
                        ? SizedBox(
                            height: 80,
                            child: OverflowBox(
                              alignment: Alignment.center,
                              maxHeight: 120 + rnd,
                              child: Row(
                                children: [
                                  Image.network(
                                    data[idx]['image'],
                                    height: 120 + rnd,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(data[idx]['title'])
                                ],
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 80,
                            child: OverflowBox(
                              alignment: Alignment.center,
                              maxHeight: 120 + rnd,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(data[idx]['title']),
                                  const SizedBox(width: 20),
                                  Image.network(
                                    data[idx]['image'],
                                    height: 120 + rnd,
                                  ),
                                ],
                              ),
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

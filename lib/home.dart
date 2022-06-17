import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _SLController;
  late TextEditingController _SWController;
  late TextEditingController _PLController;
  late TextEditingController _PWController;

  late String _species;

  @override
  void initState() {
    _SLController = TextEditingController();
    _SWController = TextEditingController();
    _PLController = TextEditingController();
    _PWController = TextEditingController();

    _species = 'all';

    super.initState();
  }

  @override
  void dispose() {
    _SLController.dispose();
    _SWController.dispose();
    _PLController.dispose();
    _PWController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iris 품종 예측'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: _SLController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Sepal Length 길이를 입력해주세요'),
              ),
              TextField(
                controller: _SWController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Sepal Width 길이를 입력해주세요'),
              ),
              TextField(
                controller: _PLController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Petal Length 길이를 입력해주세요'),
              ),
              TextField(
                controller: _PWController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Petal Width 길이를 입력해주세요'),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    predict();
                  },
                  child: const Text('입력')),
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/$_species.jpg'),
              )
            ],
          ),
        ),
      ),
    );
  }

  predict() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/res_iris.jsp?sepalLength=${_SLController.text}&sepalWidth=${_SWController.text}&petalWidth=${_PWController.text}&petalLength=${_PLController.text}');
    var res = await http.get(url);
    var resConv = jsonDecode(utf8.decode(res.bodyBytes))['result'];
    setState(() {
      _species = resConv;
      _showDialog(context);
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('품종 예측 결과 결과'),
            content: Text('입력하신 품종은 $_species 입니다'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('사용자 정보 입력에 문제가 발생 하였습니다.'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }
}

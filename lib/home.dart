import 'package:flutter/material.dart';
import 'package:flutter_lecture/delete.dart';
import 'package:flutter_lecture/update.dart';
import 'package:mysql1/mysql1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'qwer1234',
      db: 'education');
  late List data;

  @override
  void initState() {
    data = [];
    listAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert & return for CRUD'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert')
                    .then((value) => listAction());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdatePage(
                            code: data[index]['scode'],
                            name: data[index]['sname'],
                            dept: data[index]['sdept'],
                            phone: data[index]['sphone']),
                      )).then((value) => listAction());
                },
                onLongPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeletePage(
                            code: data[index]['scode'],
                            name: data[index]['sname'],
                            dept: data[index]['sdept'],
                            phone: data[index]['sphone']),
                      )).then((value) => listAction());
                },
                child: Card(
                  child: Column(
                    children: ['Code', 'Name', 'Dept', 'Phone']
                        .map((e) => Row(
                              children: [
                                Text(e,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(data[index]['s${e.toLowerCase()}']),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('입력 결과'),
            content: const Text('입력이 완료되었습니다.'),
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

  listAction() async {
    var conn = await MySqlConnection.connect(settings);
    var results =
        await conn.query("select scode, sname, sdept, sphone from student");
    setState(() {
      data = results.toList();
    });
    conn.close();
  }
}

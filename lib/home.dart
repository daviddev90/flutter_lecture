import 'package:flutter/material.dart';
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

  //Property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  var textfields = [];
  late List data;

  @override
  void initState() {
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    data = [];

    textfields = [
      {"ct": codeController, "name": "학번"},
      {"ct": nameController, "name": "이름"},
      {"ct": deptController, "name": "학과"},
      {"ct": phoneController, "name": "번호"},
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert & return for CRUD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ...textfields
                  .map((e) => TextField(
                        controller: e["ct"],
                        decoration:
                            InputDecoration(labelText: '${e["name"]}을 입력하세요'),
                        keyboardType: TextInputType.text,
                      ))
                  .toList(),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    insertAction();
                  },
                  child: const Text('입력')),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    listAction();
                  },
                  child: const Text('출력')),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Text(data[index]['scode']);
                  },
                ),
              )
            ],
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

  //functions
  insertAction() async {
    var conn = await MySqlConnection.connect(settings);

    var result = await conn.query(
        'insert into student (scode, sname, sdept, sphone) values (?, ?, ?, ?)',
        [
          codeController.text,
          nameController.text,
          deptController.text,
          phoneController.text
        ]);
    conn.close();
  }

  hello() async {
    // var result = await conn.query(
    //     'insert into student (scode, sname, sdept, sphone) values (?, ?, ?, ?)',
    //     ['c123', 'bob', '사학과', 25]);

    // await conn.query(
    // 'update users set age=? where name=?',
    // [26, 'Bob']);
  }
}

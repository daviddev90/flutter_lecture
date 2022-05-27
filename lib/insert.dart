import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
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

  @override
  void initState() {
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

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
        title: const Text('Insert for CRUD'),
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
            ],
          ),
        ),
      ),
    );
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

    Navigator.pop(context);
  }
}

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class UpdatePage extends StatefulWidget {
  final String code;
  final String name;
  final String dept;
  final String phone;
  const UpdatePage(
      {Key? key,
      required this.code,
      required this.name,
      required this.dept,
      required this.phone})
      : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
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

    codeController.text = widget.code;
    nameController.text = widget.name;
    deptController.text = widget.dept;
    phoneController.text = widget.phone;

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
        title: const Text('Update'),
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
                        readOnly: e["name"] == "학번",
                      ))
                  .toList(),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    updateAction();
                  },
                  child: const Text('수정')),
            ],
          ),
        ),
      ),
    );
  }

  updateAction() async {
    var conn = await MySqlConnection.connect(settings);
    await conn
        .query('update student set sname=?, sdept=?, sphone=? where scode=?', [
      nameController.text,
      deptController.text,
      phoneController.text,
      codeController.text
    ]);
    conn.close();

    Navigator.pop(context);
  }
}

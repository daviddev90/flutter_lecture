import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late TextEditingController num1;
  late TextEditingController num2;

  late TextEditingController add;
  late TextEditingController substract;
  late TextEditingController multiple;
  late TextEditingController divide;

  late bool _addS;
  late bool _substractS;
  late bool _multipleS;
  late bool _divideS;

  @override
  void initState() {
    num1 = TextEditingController();
    num2 = TextEditingController();

    add = TextEditingController();
    substract = TextEditingController();
    multiple = TextEditingController();
    divide = TextEditingController();

    _addS = false;
    _substractS = false;
    _multipleS = false;
    _divideS = false;

    super.initState();
  }

  void calAdd() {
    if (_addS) {
      if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
        add.text = '';
      } else {
        add.text = (int.parse(num1.text) + int.parse(num2.text)).toString();
      }
    } else {
      add.text = '';
    }
  }

  void calSubstract() {
    if (_substractS) {
      if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
        substract.text = '';
      } else {
        substract.text =
            (int.parse(num1.text) - int.parse(num2.text)).toString();
      }
    } else {
      substract.text = '';
    }
  }

  void calMultiple() {
    if (_multipleS) {
      if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
        multiple.text = '';
      } else {
        multiple.text =
            (int.parse(num1.text) * int.parse(num2.text)).toString();
      }
    } else {
      multiple.text = '';
    }
  }

  void calDivide() {
    if (_divideS) {
      if (num1.text.trim().isEmpty || num2.text.trim().isEmpty) {
        divide.text = '';
      } else {
        divide.text = (int.parse(num1.text) / int.parse(num2.text)).toString();
      }
    } else {
      divide.text = '';
    }
  }

  void remove() {
    num1.text = '';
    num2.text = '';
    add.text = '';
    substract.text = '';
    multiple.text = '';
    divide.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //scaffold를 감싸고 아래 내용을 줘야 키보드를 없앨 수 있다.
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: num1,
                  decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: num2,
                  decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          calAdd();
                          calSubstract();
                          calMultiple();
                          calDivide();
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        child: const Text('계산하기')),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          remove();
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text('지우기'))
                  ],
                ),
                SwitchListTile(
                    value: _addS,
                    title: const Text('덧셈'),
                    onChanged: (bool userValue) {
                      setState(() {
                        _addS = userValue;
                      });
                      calAdd();
                    },
                    secondary: const Icon(Icons.add)),
                SwitchListTile(
                    value: _substractS,
                    title: const Text('뺄셈'),
                    onChanged: (bool userValue) {
                      setState(() {
                        _substractS = userValue;
                      });
                      calSubstract();
                    },
                    secondary: const Icon(Icons.remove)),
                SwitchListTile(
                    value: _multipleS,
                    title: const Text('곱셈'),
                    onChanged: (bool userValue) {
                      setState(() {
                        _multipleS = userValue;
                      });
                      calMultiple();
                    },
                    secondary: const Icon(Icons.close)),
                SwitchListTile(
                    value: _divideS,
                    title: const Text('나눗셈'),
                    onChanged: (bool userValue) {
                      setState(() {
                        _divideS = userValue;
                      });
                      calDivide();
                    },
                    secondary: const Icon(Icons.percent)),
                TextField(
                  readOnly: true,
                  controller: add,
                  decoration: const InputDecoration(labelText: '덧셈 결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: substract,
                  decoration: const InputDecoration(labelText: '뺄셈 결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: multiple,
                  decoration: const InputDecoration(labelText: '곱셈 결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: divide,
                  decoration: const InputDecoration(labelText: '나눗셈 결과'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -- Functions

}

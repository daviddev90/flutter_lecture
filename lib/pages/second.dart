import 'package:flutter/material.dart';
import 'package:flutter_lecture/animal_item.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // late TextEditingController nameController;
  final nameController = TextEditingController(); //위와 같음 > initstate에서 일 안해도 됨
  int radioValue = 0;
  bool canFly = false;
  var _imgPath;
  String _imgName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: _radioChange,
                ),
                const Text('곤충'),
                Radio(
                    value: 1, groupValue: radioValue, onChanged: _radioChange),
                const Text('포유류'),
                Radio(
                    value: 2, groupValue: radioValue, onChanged: _radioChange),
                const Text('영장류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('날 수 있나요?'),
                Checkbox(
                    value: canFly,
                    onChanged: (check) {
                      setState(() {
                        canFly = check!;
                      });
                    })
              ],
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: (){
                      _imgPath = 'images/cow.png';
                      setState(() {
                        _imgName = '소';
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _imgPath = 'images/cow.png';
                      setState(() {
                        _imgName = '벌';
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _imgPath = 'images/cow.png';
                      setState(() {
                        _imgName = '소';
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _imgPath = 'images/cow.png';
                      setState(() {
                        _imgName = '소';
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _imgPath = 'images/cow.png';
                      setState(() {
                        _imgName = '소';
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _radioChange(int? value) {
    setState(() {
      radioValue = value!;
    });
  }
}

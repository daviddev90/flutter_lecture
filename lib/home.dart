import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String _buttonState;
  late String _buttonTitle;
  late Color _buttonColor;

  @override
  void initState() {
    _buttonState = 'ON';
    _buttonTitle = '버튼을 누르세요!';
    _buttonColor = Colors.red;
    super.initState();
  }

  void changeBtnState() {
    setState(() {
      if (_buttonState == 'ON') {
        _buttonState = 'OFF';
        _buttonTitle = 'Press the Button';
        _buttonColor = Colors.yellow;
      } else {
        _buttonState = 'ON';
        _buttonTitle = '버튼을 누르세요';
        _buttonColor = Colors.red;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                changeBtnState();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(160, 48), primary: _buttonColor),
              child: Text(_buttonTitle),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('버튼상태: $_buttonState')
          ],
        ),
      ),
    );
  }
}

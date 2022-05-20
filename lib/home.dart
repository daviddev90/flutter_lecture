import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late bool _isOn;
  late bool _isSmall;

  @override
  void initState() {
    //앱 실행 시 한 번만 실행;
    _isOn = true;
    _isSmall = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('점등행사'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 500,
                child: Center(
                    child: Image.asset(
                  _isOn ? 'images/lamp_on.png' : 'images/lamp_off.png',
                  width: _isSmall ? 100 : 200,
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isSmall = !_isSmall;
                        });
                      },
                      child: Text(_isSmall ? '전구 크게' : '전구 작게')),
                  Column(
                    children: [
                      const Text('전구 스위치'),
                      Switch(
                          value: _isOn,
                          onChanged: (value) {
                            setState(() {
                              _isOn = !_isOn;
                            });
                          })
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_lecture/pages/bmiPage.dart';
import 'package:flutter_lecture/pages/calPage.dart';
import 'package:flutter_lecture/pages/homePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  int _navIdx = 0;

  final List<Widget> _widgets = <Widget>[
    const HomePage(),
    const BMIPage(),
    const CalPage()
  ];

  void _onNavTapped(int index) {
    setState(() {
      _navIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //scaffold를 감싸고 아래 내용을 줘야 키보드를 없앨 수 있다.
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: _widgets.elementAt(_navIdx),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'BMI계산기'),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank), label: '칼로리계산기'),
          ],
          onTap: _onNavTapped,
          currentIndex: _navIdx,
        ),
      ),
    );
  }

  // -- Functions

}

import 'package:flutter/material.dart';
import 'package:flutter_lecture/flag_item.dart';
import 'package:flutter_lecture/pages/first.dart';
import 'package:flutter_lecture/pages/second.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //property
  List<Flag> flagList = [];
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    flagList.add(Flag(imagePath: 'images/austria.png', name: '오스트리아'));
    flagList.add(Flag(imagePath: 'images/belgium.png', name: '벨기에'));
    flagList.add(Flag(imagePath: 'images/estonia.png', name: '에스토니아'));
    flagList.add(Flag(imagePath: 'images/france.png', name: '프랑스'));
    flagList.add(Flag(imagePath: 'images/germany.png', name: '독일'));
    flagList.add(Flag(imagePath: 'images/hungary.png', name: '헝가리'));
    flagList.add(Flag(imagePath: 'images/italy.png', name: '이탈리아'));
    flagList.add(Flag(imagePath: 'images/latvia.png', name: '라트비아'));
    flagList.add(Flag(imagePath: 'images/lithuania.png', name: '리투아니아'));
    flagList.add(Flag(imagePath: 'images/luxemburg.png', name: '룩셈부르크'));
    flagList.add(Flag(imagePath: 'images/netherland.png', name: '네덜란드'));
    flagList.add(Flag(imagePath: 'images/romania.png', name: '루마니아'));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나라이름 맞추기'),
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow[100],
        height: 60,
        child: TabBar(controller: controller, tabs: const [
          Tab(
              icon: Icon(
            Icons.abc,
            color: Colors.red,
          )),
          Tab(
              icon: Icon(
            Icons.abc,
            color: Colors.blue,
          )),
        ]),
      ),
      body: TabBarView(
          controller: controller,
          children: [FirstPage(list: flagList), SecondPage()]),
    );
  }
}

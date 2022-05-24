import 'package:flutter/material.dart';
import 'package:flutter_lecture/animal_item.dart';
import 'package:flutter_lecture/pages/first.dart';
import 'package:flutter_lecture/pages/second.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //property
  late TabController controller;
  List<Animal> animalList = [];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
        imgPath: 'images/bee.png', name: '벌', species: '곤충', canFly: true));
    animalList.add(Animal(
        imgPath: 'images/cat.png', name: '고양이', species: '포유류', canFly: false));
    animalList.add(Animal(
        imgPath: 'images/cow.png', name: '소', species: '포유류', canFly: false));
    animalList.add(Animal(
        imgPath: 'images/dog.png', name: '강아지', species: '포유류', canFly: false));
    animalList.add(Animal(
        imgPath: 'images/fox.png', name: '여우', species: '포유류', canFly: false));
    animalList.add(Animal(
        imgPath: 'images/monkey.png',
        name: '원숭이',
        species: '영장류',
        canFly: false));
    animalList.add(Animal(
        imgPath: 'images/pig.png', name: '돼지', species: '포유류', canFly: false));
    animalList.add(Animal(
        imgPath: 'images/wolf.png', name: '늑대', species: '포유류', canFly: false));

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
        title: const Text('Listview Test'),
      ),
      body: TabBarView(
          controller: controller,
          children: [FirstPage(list: animalList), SecondPage()]),
      bottomNavigationBar: TabBar(controller: controller, tabs: const [
        Tab(
          icon: Icon(
            Icons.looks_one,
            color: Colors.blue,
          ),
          text: 'List ',
        ),
        Tab(
          icon: Icon(
            Icons.looks_two,
            color: Colors.red,
          ),
        )
      ]),
    );
  }
}

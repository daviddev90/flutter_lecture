import 'package:flutter/material.dart';
import 'package:flutter_lecture/animal_item.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;

  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: widget.list.length, //위의 클래스에 있는 list
            itemBuilder: (context, idx) {
              return GestureDetector(
                onTap: () {
                  _showAlert(context, widget.list[idx]);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[idx].imgPath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(widget.list[idx].name)
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  _showAlert(BuildContext context, Animal animal) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(animal.name),
            content: Text('이 동물은 ${animal.species} 입니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('닫기'))
            ],
          );
        });
  }
}

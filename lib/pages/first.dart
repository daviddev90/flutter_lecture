import 'package:flutter/material.dart';
import 'package:flutter_lecture/flag_item.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, idx) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              _showDialog(context, widget.list[idx]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[idx].imagePath,
                      width: 90,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text('${widget.list[idx].name.substring(0, 1)}__________'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }

  _showDialog(BuildContext context, Flag flag) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('국가명'),
            content: Text('이 국가는 ${flag.name} 입니다.'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('닫기'))
            ],
          );
        });
  }
}

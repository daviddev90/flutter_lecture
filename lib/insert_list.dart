import 'package:flutter/material.dart';
import 'package:flutter_lecture/message.dart';
import 'package:flutter_lecture/todo_list.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

enum ImageSet { cart, clock, pencil }

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late String _imgPath;

  @override
  void initState() {
    _imgPath = 'images/cart.png';
    textEditingController = TextEditingController();
    super.initState();
  }

  ImageSet? _img = ImageSet.cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('하이'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
                title: Row(
                  children: [Image.asset('images/cart.png'), const Text('구매')],
                ),
                leading: Radio<ImageSet>(
                  value: ImageSet.cart,
                  groupValue: _img,
                  onChanged: (ImageSet? value) {
                    setState(() {
                      _img = value;
                      _imgPath = 'images/cart.png';
                    });
                  },
                )),
            ListTile(
                title: Row(
                  children: [Image.asset('images/clock.png'), const Text('약속')],
                ),
                leading: Radio<ImageSet>(
                  value: ImageSet.clock,
                  groupValue: _img,
                  onChanged: (ImageSet? value) {
                    setState(() {
                      _img = value;
                      _imgPath = 'images/clock.png';
                    });
                  },
                )),
            ListTile(
                title: Row(
                  children: [
                    Image.asset('images/pencil.png'),
                    const Text('스터디')
                  ],
                ),
                leading: Radio<ImageSet>(
                  value: ImageSet.pencil,
                  groupValue: _img,
                  onChanged: (ImageSet? value) {
                    setState(() {
                      _img = value;
                      _imgPath = 'images/pencil.png';
                    });
                  },
                )),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(labelText: '목록을 입력하세요'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }

  addList() {
    Message.todolist =
        TodoList(imagePath: _imgPath, workList: textEditingController.text);
    Message.action = true;
  }
}

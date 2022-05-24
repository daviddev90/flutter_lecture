import 'package:flutter/material.dart';
import 'package:flutter_lecture/detail_list.dart';
import 'package:flutter_lecture/message.dart';
import 'package:flutter_lecture/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책 구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert')
                    .then((value) => rebuildData());
              },
              icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, idx) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                child: GestureDetector(
                  onTap: () {
                    Message.todolist = todoList[idx];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailList(),
                        )); // 아래와 동일
                    // Navigator.pushNamed(context, '/detail');
                  },
                  child: Card(
                    color: idx % 2 == 0 ? Colors.amber[100] : Colors.green[100],
                    child: Row(
                      children: [
                        Image.asset(
                          todoList[idx].imagePath,
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(todoList[idx].workList)
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  rebuildData() {
    setState(() {
      if (Message.action) {
        todoList.add(Message.todolist);
        Message.action = false;
      }
    });
  }
}

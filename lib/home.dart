import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late int count;

  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 카운트는 $count 입니다.'),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  //body 안에 있으면 화면 스크롤되면 같이 움직임
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  //body 안에 있으면 화면 스크롤되면 같이 움직임
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(
                    Icons.remove,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //얘는 화면 스크롤되어도 안 움직임
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

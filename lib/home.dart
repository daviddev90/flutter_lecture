import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('hello world');
              },
              child: const Text(
                'Text Button',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print('Elevated');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('Elevated Button')),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(color: Colors.black87, width: 2.0)),
              child: const Text('Outlined Button'),
            ),
            TextButton.icon(
              onPressed: (() {}),
              icon: const Icon(
                Icons.abc,
                size: 30,
              ),
              label: const Text('양키 고 홈'),
              style: TextButton.styleFrom(primary: Colors.purple),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.android_sharp),
              label: const Text('Android'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: const Size(160, 48)),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(color: Colors.black87, width: 2.0)),
              icon: const Icon(
                Icons.savings_rounded,
                size: 40,
              ),
              label: const Text(
                '돼지야',
                style: TextStyle(fontSize: 32),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print('hello world');
                  },
                  style: TextButton.styleFrom(minimumSize: const Size(160, 40)),
                  child: const Text(
                    'Text Button',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Elevated');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(160, 40)),
                  child: const Text(
                    'Elevated Button',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

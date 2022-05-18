import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('네이버 메일'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/received');
              },
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sent');
              },
              icon: const Icon(Icons.email_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/received');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text('받은 메일함')),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sent');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text('보낸 메일함')),
          ],
        ),
      ),
    );
  }
}

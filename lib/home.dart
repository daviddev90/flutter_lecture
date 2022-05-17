import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/Lee.jpg'),
                radius: 70,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Divider(
                thickness: 3,
              ),
            ),
            const Text('성웅',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 16),
              child: Text('이순신 장군',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            const Text('전적',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 16),
              child: Text('62전 62승',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
            ...['옥포해전', '사천포해전', '당포해전', '한산도대첩', '부산포해전', '명량해전', '노량해전']
                .map((e) => Row(children: [
                      const Icon(Icons.check_circle_outline, size: 20.0),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: const TextStyle(fontSize: 18),
                      )
                    ]))
                .toList(),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/turtle.gif'),
                radius: 50,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Pikachu extends StatelessWidget {
  const Pikachu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Flutter'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'images/pikachu-1.jpg',
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        'images/pikachu-2.jpg',
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        'images/pikachu-3.jpg',
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

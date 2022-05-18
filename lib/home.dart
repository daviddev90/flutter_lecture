import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/pikachu-1.jpg'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-2.jpg'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-3.jpg'),
              )
            ],
            accountName: Text('신동원'),
            accountEmail: Text('dongwon@dongwon.co.kr'),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: const Text('Home'),
            onTap: () => _showDialog(context, '홈'),
          ),
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: Colors.black,
            ),
            title: const Text('Phone'),
            onTap: () => _showDialog(context, '휴대폰'),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: const Text('Home'),
            onTap: () => _showDialog(context, '홈'),
          ),
        ],
      )),
    );
  }
}

void _showDialog(BuildContext context, String text) {
  // 경고창을 보여주는 가장 흔한 방법.
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('선택 완료!'),
          content: Text('$text 항목을 선택했습니다.'),
        );
      });
}

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            Icons.email,
            color: Colors.lightBlue,
          ),
          title: const Text('보낸 메일함'),
          onTap: () {
            Navigator.pushNamed(context, '/sent');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.email_outlined,
            color: Colors.red,
          ),
          title: const Text('받은 메일함'),
          onTap: () {
            Navigator.pushNamed(context, '/received');
          },
        ),
      ],
    ));
  }
}

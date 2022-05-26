import 'package:flutter/material.dart';
import 'package:flutter_lecture/webview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(controller: _tabController, children: const [
        WebViewPage(initUrl: 'www.google.com'),
        WebViewPage(initUrl: 'www.naver.com'),
        WebViewPage(initUrl: 'www.daum.net'),
      ]),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 90,
        child: TabBar(controller: _tabController, tabs: const [
          Tab(
            icon: Icon(Icons.face),
            text: '구글',
          ),
          Tab(
            icon: Icon(Icons.face),
            text: '네이버',
          ),
          Tab(
            icon: Icon(Icons.scuba_diving_outlined),
            text: '다음',
          ),
        ]),
      ),
    );
  }
}

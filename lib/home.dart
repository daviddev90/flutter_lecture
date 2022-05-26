import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lecture/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final Completer<WebViewController> _controller1 =
      Completer<WebViewController>();
  final Completer<WebViewController> _controller2 =
      Completer<WebViewController>();
  final Completer<WebViewController> _controller3 =
      Completer<WebViewController>();

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
      body: TabBarView(controller: _tabController, children: [
        WebViewPage(controller: _controller1, initUrl: 'www.google.com'),
        WebViewPage(controller: _controller2, initUrl: 'www.naver.com'),
        WebViewPage(controller: _controller3, initUrl: 'www.daum.net'),
      ]),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 90,
        child: TabBar(controller: _tabController, tabs: const [
          Tab(
            icon: Icon(Icons.abc),
            text: '구글',
          ),
          Tab(
            icon: Icon(Icons.abc),
            text: '네이버',
          ),
          Tab(
            icon: Icon(Icons.abc),
            text: '다음',
          ),
        ]),
      ),
    );
  }
}

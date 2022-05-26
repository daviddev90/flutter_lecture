import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;

  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Row(
            children: [
              Expanded(
                //Flexible도 됨
                child: TextField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  controller: textController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _reloadSite();
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
        toolbarHeight: 70,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack()
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  controller.data!.goBack();
                },
                child: const Icon(Icons.arrow_back),
              );
            } else {
              return Stack();
            }
          }),
    );
  }

  //Functions
  _reloadSite() {
    _controller.future
        .then((value) => value.loadUrl('https://${textController.text}'));
  }
}

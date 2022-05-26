import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewPage extends StatefulWidget {
  final Completer<WebViewController> controller;
  final String initUrl;
  const WebViewPage({Key? key, required this.controller, required this.initUrl})
      : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.initUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            if (!widget.controller.isCompleted) {
              widget.controller.complete(webViewController);
            }
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
    );
  }
}

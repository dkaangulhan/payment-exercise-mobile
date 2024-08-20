import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// This page is for 3DSecure payment.
class ThreedsPage extends StatefulWidget {
  /// This page is for 3DSecure payment.
  const ThreedsPage({
    required this.htmlString,
    super.key,
  });

  // ignore: public_member_api_docs
  final String htmlString;

  @override
  State<ThreedsPage> createState() => _ThreedsPageState();
}

class _ThreedsPageState extends State<ThreedsPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..loadHtmlString(widget.htmlString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}

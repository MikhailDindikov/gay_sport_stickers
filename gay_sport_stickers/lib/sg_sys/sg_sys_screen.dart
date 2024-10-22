import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SGSysScreen extends StatefulWidget {
  final String sgt;
  const SGSysScreen({super.key, required this.sgt});

  @override
  State<SGSysScreen> createState() => _SGSysScreenState();
}

class _SGSysScreenState extends State<SGSysScreen> {
  late WebViewController sgCon;
  late String sgTit;

  @override
  void initState() {
    sgTit = widget.sgt == 'pp'
        ? 'Privacy policy'
        : widget.sgt == 'tu'
            ? 'Terms of use'
            : 'Support';
    sgCon = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.sgt == 'pp'
          ? 'https://docs.google.com/document/d/1YeaWFdKUQdqGG8RqrJPRCFyyGrxeJS4amp-vaL3CFfc/edit?usp=sharing'
          : widget.sgt == 'tu'
              ? 'https://docs.google.com/document/d/1v3vFfnqL_PutsMtimlx6BnUr8w-96LKQ7hhk8y6UQBw/edit?usp=sharing'
              : 'https://form.jotform.com/242944436617463'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 31, 53, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: WebViewWidget(
                    controller: sgCon,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            'sg_assets/sg_icons/back.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          sgTit.toUpperCase(),
                          style: TextStyle(
                            fontSize: 36,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

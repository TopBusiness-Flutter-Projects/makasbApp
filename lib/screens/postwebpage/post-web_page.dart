import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../colors/colors.dart';
import '../../constants/app_constant.dart';
import '../../models/payment_model.dart';

class PostWebPage extends StatefulWidget {
  final String url;

  const PostWebPage({Key? key, required this.url}) : super(key: key);

  @override
  State<PostWebPage> createState() => _PostWebPageState(url: url);
}

class _PostWebPageState extends State<PostWebPage> {
  String url;

  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  WebViewController? webViewController;
  _PostWebPageState({required this.url});

  @override
  void initState() {
    super.initState();
    print("d;d;d;;");
    print(url);
    controller = CountdownTimerController(endTime: endTime, onEnd: route);
webViewController=WebViewController(onPermissionRequest: (request) {

},);
webViewController!.loadRequest(Uri.parse(url));
    // Enable virtual display.
  //  if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: webViewController!,

        ),
        Center(
          child: CountdownTimer(
            controller: controller,
            onEnd: route,
            endTime: endTime,
            textStyle: TextStyle(color: AppColors.transparent),
            widgetBuilder: (_, time) {
              if (time == null) {
                return Container();
              }
              return Text(
                  '${time.sec}',
                style:  const TextStyle(color: AppColors.red),);
            },
          ),
        )
      ],
    );
  }

  route() {
    Navigator.pop(context);
  }
}

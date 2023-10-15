import 'dart:collection';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/app_constant.dart';
import '../../models/payment_model.dart';

class paymetPage extends StatefulWidget {
  final PaymentDataModel paymentDataModel;

  const paymetPage({Key? key, required this.paymentDataModel})
      : super(key: key);

  @override
  State<paymetPage> createState() =>
      _paymetPageState(paymentDataModel: paymentDataModel);
}

class _paymetPageState extends State<paymetPage> {
  PaymentDataModel paymentDataModel;

  _paymetPageState({required this.paymentDataModel});

  WebViewController? webViewController;


  @override
  void initState() {
    super.initState();
    webViewController=WebViewController(onPermissionRequest: (request) {

    },);
    webViewController!.loadRequest(Uri.parse(paymentDataModel.data));
    webViewController!..setNavigationDelegate(
    NavigationDelegate(onPageStarted: (url) {

    },

    onPageFinished: (String url) {
    if(url.contains("status=1")){
    Fluttertoast.showToast(
    msg:'sucess pay'.tr(), // message
    toastLength: Toast.LENGTH_SHORT, // length
    gravity: ToastGravity.BOTTOM, // location
    timeInSecForIosWeb: 1 // duration
    );
    Navigator.pop(context);
    }

    else if(url.contains("status=2")){
      webViewController!.loadRequest(Uri.parse(paymentDataModel.data));
    }
    else if(url.contains("status=0")){
    Fluttertoast.showToast(
    msg:'faild pay'.tr(), // message
    toastLength: Toast.LENGTH_SHORT, // length
    gravity: ToastGravity.BOTTOM, // location
    timeInSecForIosWeb: 1 // duration
    );
    Navigator.pop(context);
    }

    },));
    // Enable virtual display.
    //  if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      WebViewWidget(controller: webViewController!,


    )]
    );

}}

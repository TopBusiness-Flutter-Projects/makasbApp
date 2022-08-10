import 'dart:async';
import 'dart:ui';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CustomDialog extends StatelessWidget {

dialogContent(BuildContext context) {
return Container(
decoration: new BoxDecoration(
color: Colors.white,
shape: BoxShape.rectangle,
borderRadius: BorderRadius.circular(10),
boxShadow: [
BoxShadow(
color: Colors.black26,
blurRadius: 10.0,
offset: const Offset(0.0, 10.0),
),
],
),
child: Column(
mainAxisSize: MainAxisSize.min, // To make the card compact
children: <Widget>[
Image.asset( '${AppConstant.localImagePath}logo.png', height: 100),
Text(
"Text 1",
style: TextStyle(
fontSize: 24.0,
fontWeight: FontWeight.w700,
),
),
SizedBox(height: 16.0),
Text(
"Text 1",
style: TextStyle(
fontSize: 24.0,
fontWeight: FontWeight.w700,
),
),
SizedBox(height: 24.0),
Align(
alignment: Alignment.bottomCenter,
child: IconButton( icon: Icon(Icons.cancel), onPressed: () {

  Navigator.pop(context);
},

),
),
],
),
);
}

@override
Widget build(BuildContext context) {
return Dialog(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
elevation: 0.0,
backgroundColor: Colors.transparent,
child: dialogContent(context),
);

}}
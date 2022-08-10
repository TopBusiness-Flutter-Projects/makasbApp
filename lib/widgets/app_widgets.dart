import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';

class AppWidget {
  static AppBar buildAppBar({title = '',
    titleColor = AppColors.black,
    bg = AppColors.white,
    elevation = 0.0}) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: titleColor, fontSize: 18.0),
      ),
      elevation: elevation,
      backgroundColor: bg,
    );
  }

  static Widget svg(String name, Color color, double width, double height) {
    return SvgPicture.asset(
      AppConstant.localImagePath + name,
      width: width,
      height: height,
      color: color,
    );
  }


  static Widget buildBackArrow({required BuildContext context,double padding=16.0,bool paddingAll = false}) {
    String lang = EasyLocalization
        .of(context)!
        .locale
        .languageCode;

    return Container(
      margin:  EdgeInsets.symmetric(horizontal: padding,vertical: paddingAll?padding:0),
      child: Transform.rotate(
          angle: lang == 'ar' ? ( 3.14 ) : 0,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: AppWidget.svg('back_arrow.svg', AppColors.black, 24.0, 24.0),
          )),
    );
  }
  static createProgressDialog(BuildContext context, String msg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.colorPrimary,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  msg,
                  style: TextStyle(color: AppColors.black, fontSize: 15.0),
                )
              ],
            ),
          );
        });
  }

}

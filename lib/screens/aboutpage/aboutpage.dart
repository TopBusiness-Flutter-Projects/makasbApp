import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';
class Aboutpage extends StatelessWidget {
  final String? Kind;
  final String text ;
  const Aboutpage({Key? key, this.Kind, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: true,

        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: false,
          title: Text(
            Kind!.tr(),
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          leading: AppWidget.buildBackArrow(context: context),
        ),
        backgroundColor: AppColors.white,
        body:
            Container
              (
                padding: EdgeInsets.all(7),
        child:ListView(children: [
          Container(
            padding: EdgeInsets.all(7),
          alignment: Alignment.topCenter,
          width: 220.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                '${AppConstant.localImagePath}logo.png',
                width: 170.0,
                height: 60,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 64.0,
              ),
            ],
          ),
        ),
          // Row(
          //
          //   children: [
          //  // give it width
          //
          //     Text(
          //
          //       'Makasb'.tr(),
          //       style: const TextStyle(
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.normal,
          //           color: AppColors.colorPrimary),
          //     ),
          //     SizedBox(width: 10,),
          //     Text(
          //       'Makasb helps you to'.tr(),
          //       style: const TextStyle(
          //           fontSize: 16.0,
          //           fontWeight: FontWeight.normal,
          //           color: AppColors.black),
          //     )
          //   ],
          // ),

          const SizedBox(
            height: 10.0,
          ),
          Expanded(flex: 1,child: Container(
              child: Text(
                  '$text'
                  ,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
          ),)

        ],))
    );
  }
}

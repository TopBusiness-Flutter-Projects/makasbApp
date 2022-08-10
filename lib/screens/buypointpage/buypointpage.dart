import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class buyBointWidget extends StatefulWidget {
  const buyBointWidget({Key? key}) : super(key: key);

  @override
  State<buyBointWidget> createState() => _buyBointWidgetState();
}

class _buyBointWidgetState extends State<buyBointWidget>
    with SingleTickerProviderStateMixin {
  List<int> _list = [
    10,
    20,
    30,
    40,
    50,
    10,
    20,
    30,
    40,
    50,
    10,
    20,
    30,
    40,
    50
  ];

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: false,
          title: Text(
            'buypoint'.tr(),
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          leading: AppWidget.buildBackArrow(context: context),
        ),
        backgroundColor: AppColors.grey10,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(7),
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const SizedBox(height: 10),
            LayoutBuilder(
                builder: (context, constraints) => GridView.builder(
                      shrinkWrap: true,
                      itemCount: _list.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
                        childAspectRatio: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Expanded(
                            child: InkWell(
                                child: Container(
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                              border: Border.all(color: AppColors.grey5),
                              color: AppColors.white,

                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(0))),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "\$",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.grey5),
                                  ),
                                  Text(
                                    "5".tr(),
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.colorPrimary),
                                  )
                                ],
                              ),
                              Text(
                                "5000".tr(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.colorPrimary),
                              ),
                              Text(
                                "point".tr(),
                                style: const TextStyle(
                                    fontSize: 20.0, color: AppColors.grey1),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "buy".tr(),
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.red),
                              )
                            ],
                          ),
                        )));
                      },
                    )),
          ]),
        ));
  }
}

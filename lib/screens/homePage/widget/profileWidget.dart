import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class profileWidget extends StatefulWidget {
  const profileWidget({Key? key}) : super(key: key);

  @override
  State<profileWidget> createState() => _profileWidgetState();
}

class _profileWidgetState extends State<profileWidget>
    with SingleTickerProviderStateMixin {
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
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        child: ListView(shrinkWrap: true, children: [

          SizedBox(
              height: 173,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    width: width,
                    height: 125.0,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                '${AppConstant.localImagePath}top_profile.png'),
                            fit: BoxFit.fill)),
                  )),
                  Positioned(
                      top: 77.0,
                      left: width / 2 - 48,
                      child: SizedBox(
                        width: 96,
                        height: 96,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(width),
                          child: Image.asset(
                            "${AppConstant.localImagePath}avatar.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ],
              )),
          Container(
            height: 20,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Emad",

                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                  color: AppColors.black),
                ),

              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Card(
              color: AppColors.white,
              elevation: 1.0,
              margin: const EdgeInsets.all(1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 72.0,
                      child: InkWell(
                        child: Card(
                          elevation: 1.0,
                          color: AppColors.grey3,
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppWidget.svg('profile.svg', AppColors.colorPrimary, 24.0, 24.0),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Text(
                                      "Edit Profile".tr(),
                                      style: const TextStyle(
                                          color: AppColors.color3, fontSize: 16.0),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 24.0,
                                  height: 24.0,
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Transform.rotate(
                                      angle: Localizations.localeOf(context).languageCode == 'ar'
                                          ? (180 * (3.14 / 180))
                                          : (0 * (3.14 / 180)),
                                      alignment: Alignment.center,
                                      child: AppWidget.svg(
                                          'arrow.svg', AppColors.black, 20.0, 20.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 72.0,
                      child: InkWell(
                        child: Card(
                          elevation: 1.0,
                          color: AppColors.grey3,
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppWidget.svg('profile.svg', AppColors.colorPrimary, 24.0, 24.0),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Text(
                                      "About Us".tr(),
                                      style: const TextStyle(
                                          color: AppColors.color3, fontSize: 16.0),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 24.0,
                                  height: 24.0,
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Transform.rotate(
                                      angle: Localizations.localeOf(context).languageCode == 'ar'
                                          ? (180 * (3.14 / 180))
                                          : (0 * (3.14 / 180)),
                                      alignment: Alignment.center,
                                      child: AppWidget.svg(
                                          'arrow.svg', AppColors.black, 20.0, 20.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 72.0,
                      child: InkWell(
                        child: Card(
                          elevation: 1.0,
                          color: AppColors.grey3,
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppWidget.svg('profile.svg', AppColors.colorPrimary, 24.0, 24.0),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Text(
                                      "Settings".tr(),
                                      style: const TextStyle(
                                          color: AppColors.color3, fontSize: 16.0),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 24.0,
                                  height: 24.0,
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Transform.rotate(
                                      angle: Localizations.localeOf(context).languageCode == 'ar'
                                          ? (180 * (3.14 / 180))
                                          : (0 * (3.14 / 180)),
                                      alignment: Alignment.center,
                                      child: AppWidget.svg(
                                          'arrow.svg', AppColors.black, 20.0, 20.0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),

                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'followUs'.tr(),
                  style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(

                        child: Image.asset(
                          '${AppConstant.localImagePath}facebook.png',
                          width: 40.0,
                          height: 40.0,
                        )),
                    const SizedBox(
                      width: 16.0,
                    ),
                    InkWell(
                        child: Image.asset(
                          '${AppConstant.localImagePath}instagram.png',
                          width: 40.0,
                          height: 40.0,
                        )),
                    const SizedBox(
                      width: 16.0,
                    ),
                    InkWell(
                        child: Image.asset(
                          '${AppConstant.localImagePath}twitter.png',
                          width: 40.0,
                          height: 40.0,
                        )),
                    const SizedBox(
                      width: 16.0,
                    ),
                    InkWell(
                        child: Image.asset(
                          '${AppConstant.localImagePath}snapchat.png',
                          width: 40.0,
                          height: 40.0,
                        )),
                  ],
                )
              ],
            ),
          )

        ]));
  }
}

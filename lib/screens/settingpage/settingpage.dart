import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';

import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';

class settingpage extends StatefulWidget {
  const settingpage({Key? key}) : super(key: key);

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: false,
          title: Text(
            'setting'.tr(),
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          leading: AppWidget.buildBackArrow(context: context),
        ),
        backgroundColor: AppColors.grey10,
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppWidget.svg('world.svg', AppColors.color3, 24.0, 24.0),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "language".tr(),
                      style: const TextStyle(
                          color: AppColors.color3, fontSize: 16.0),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Text(
                      "en".tr(),
                      style: const TextStyle(
                          color: AppColors.color3, fontSize: 16.0),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(builder: (context, constrainBox) {
                final width = constrainBox.constrainWidth();
                const dashWidth = 10.0;
                int itemCount = (width / (2 * dashWidth)).floor();
                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(itemCount, (_) {
                    return const SizedBox(
                      width: dashWidth,
                      height: 1.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.grey4),
                      ),
                    );
                  }),
                );
              }),
            ),
            Container(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppWidget.svg('terms.svg', AppColors.color3, 24.0, 24.0),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Terms And Conditions".tr(),
                      style: const TextStyle(
                          color: AppColors.color3, fontSize: 16.0),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(builder: (context, constrainBox) {
                final width = constrainBox.constrainWidth();
                const dashWidth = 10.0;
                int itemCount = (width / (2 * dashWidth)).floor();
                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(itemCount, (_) {
                    return const SizedBox(
                      width: dashWidth,
                      height: 1.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.grey4),
                      ),
                    );
                  }),
                );
              }),
            ),
            Container(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppWidget.svg('privacy.svg', AppColors.color3, 24.0, 24.0),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Privacy".tr(),
                      style: const TextStyle(
                          color: AppColors.color3, fontSize: 16.0),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(builder: (context, constrainBox) {
                final width = constrainBox.constrainWidth();
                const dashWidth = 10.0;
                int itemCount = (width / (2 * dashWidth)).floor();
                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(itemCount, (_) {
                    return const SizedBox(
                      width: dashWidth,
                      height: 1.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.grey4),
                      ),
                    );
                  }),
                );
              }),
            ),
            Container(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppWidget.svg('rate.svg', AppColors.color3, 24.0, 24.0),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Rate App".tr(),
                      style: const TextStyle(
                          color: AppColors.color3, fontSize: 16.0),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(builder: (context, constrainBox) {
                final width = constrainBox.constrainWidth();
                const dashWidth = 10.0;
                int itemCount = (width / (2 * dashWidth)).floor();
                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(itemCount, (_) {
                    return const SizedBox(
                      width: dashWidth,
                      height: 1.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.grey4),
                      ),
                    );
                  }),
                );
              }),
            ),
            Container(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppWidget.svg('share.svg', AppColors.color3, 24.0, 24.0),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Share App".tr(),
                      style: const TextStyle(
                          color: AppColors.color3, fontSize: 16.0),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(builder: (context, constrainBox) {
                final width = constrainBox.constrainWidth();
                const dashWidth = 10.0;
                int itemCount = (width / (2 * dashWidth)).floor();
                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(itemCount, (_) {
                    return const SizedBox(
                      width: dashWidth,
                      height: 1.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.grey4),
                      ),
                    );
                  }),
                );
              }),
            ),
            Container(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    AppWidget.svg('delete.svg', AppColors.red, 24.0, 24.0),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Delete Account".tr(),
                      style:
                          const TextStyle(color: AppColors.red, fontSize: 16.0),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                )),
            const SizedBox(
              height: 120,
            ),
      Container(
        width:20,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 15.0,
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: const Text(
              'Proceed to Pay',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),

          ],
        ));
  }
}

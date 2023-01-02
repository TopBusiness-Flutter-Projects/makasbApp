import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';

import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../preferences/preferences.dart';
import '../aboutpage/aboutpage.dart';
import 'cubit/setting_cubit.dart';

class settingpage extends StatefulWidget {
  const settingpage({Key? key}) : super(key: key);

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
 PackageInfo? packageInfo ;
 final InAppReview inAppReview = InAppReview.instance;

 @override
 void initState() {
  super.initState();
  setuppackage();
 }

 bool should=false;
  @override
  Widget build(BuildContext context) {
    SettingCubit cubit = BlocProvider.of(context);

    return
      BlocConsumer<SettingCubit, SettingState>(listener: (context, state) {
       if (state is OnLogOutSuccess) {
        Preferences.instance.clearUserData();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppConstant.pageLoginRoute,ModalRoute.withName(AppConstant.pageSplashRoute));
       }
    },
        builder: (context, state) {
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
      InkWell(
       onTap: () {
        String lang = EasyLocalization.of(context)!.locale.languageCode;

        Preferences().getAppSetting().then(
             (value) {
          value.lang = lang == 'ar' ? 'en' : 'ar';
          Preferences().setAppSetting(value);
          lang == 'ar'
              ? EasyLocalization.of(context)!.setLocale(const Locale('en'))
              : EasyLocalization.of(context)!.setLocale(const Locale('ar'));
         },
        );
        Navigator.pushReplacementNamed(context, AppConstant.pageSplashRoute);
       },
      child: Container(
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
      ))),
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
      InkWell(
        onTap: () {
          String lang = EasyLocalization.of(context)!.locale.languageCode;

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Aboutpage(

              Kind: "terms".tr(),
              text: lang == 'ar'
                  ?  cubit.settingModel.data!.terms!
                  :  cubit.settingModel.data!.terms_en!,
            );
          }));

        },
      child: Container(
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
      ))),
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
         InkWell(
          onTap: () {
           String lang = EasyLocalization.of(context)!.locale.languageCode;

           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Aboutpage(

             Kind: "privacy".tr(),
             text: lang == 'ar'
                 ?  cubit.settingModel.data!.privacy!
                 :  cubit.settingModel.data!.privacy_en!,
            );
           }));

          },
      child: Container(
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
      ))),
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
         InkWell(
          onTap: () {
           String lang = EasyLocalization.of(context)!.locale.languageCode;

       rateApp();
           },

      child: Container(
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
      ))),
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
         InkWell(
          onTap: () {

        shareApp();
          },
      child: Container(
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
      ))),
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
         InkWell(
          onTap: () {
           String lang = EasyLocalization.of(context)!.locale.languageCode;

           _showMyDialog(cubit,context);
          },
      child: Container(

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
      ))),
      const SizedBox(
      height: 120,
      ),
      Center(

      child: ElevatedButton(
      onPressed: () {
       cubit.logout(context);
      },
      style: ElevatedButton.styleFrom(
      primary: AppColors.red,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      ),
      elevation:
    15.0,
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: const Text(
              'logout',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),

          ],
        ));
  });


  }
  void shareApp() async {

   String url = '';
   String packgename=packageInfo!.packageName;

   if (Platform.isAndroid) {

    //  print("Dldlldld${packageInfo.packageName}");
    url = "https://play.google.com/store/apps/details?id=${packgename}";
   } else if (Platform.isIOS) {
    url = 'https://apps.apple.com/us/app/${packgename}';
   }
   await FlutterShare.share(title: "Makasp", linkUrl: url);
  }

  Future<void> rateApp() async {

   if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
   }

   //
   // RateMyApp rateMyApp = RateMyApp(
   //  preferencesPrefix: 'rateMyApp_',
   //  minDays: 0,
   //  minLaunches: 1,
   //  remindDays: 0,
   //  remindLaunches: 1,
   //
   // );
   //
   // await rateMyApp.init().then((value) async =>
   // {if(rateMyApp.shouldOpenDialog) {
   //  rateMyApp.showRateDialog(
   //
   //   context,
   //   title: 'Rate this app',
   //   message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.',
   //   rateButton: 'RATE',
   //   noButton: 'NO THANKS',
   //   laterButton: 'MAYBE LATER',
   //  )
   // }
   // else{
   //   should=  (await rateMyApp.isNativeReviewDialogSupported)!,
   //   if(should){
   //    await rateMyApp.launchNativeReviewDialog()}
   //   else{
   //    rateMyApp.launchStore()
   //   }
   //   // print("ddkdkkdkdkjfj")
   //  }});


  }
 Future<void> setuppackage() async {
  packageInfo=   await PackageInfo.fromPlatform();

 }
 Future<void> _showMyDialog(SettingCubit cubit,BuildContext context1) async {
  return showDialog<void>(
   context: context,

   barrierDismissible: false, // user must tap button!
   builder: (BuildContext context) {
    return AlertDialog(
     content: SingleChildScrollView(
      child: Column(
       children: <Widget>[
        Text('Would you like to delete this account?'.tr()),
       ],
      ),
     ),
     actions: <Widget>[
      TextButton(
       child: Text('Confirm'.tr()),
       onPressed: () {
        cubit.deleteaccount(context1);
        print('Confirmed');

       Navigator.of(context).pop();
       },
      ),
      TextButton(
       child: Text('Cancel'.tr()),
       onPressed: () {
        Navigator.of(context).pop();
       },
      ),
     ],
    );
   },
  );
 }
}

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';

class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage>
 with SingleTickerProviderStateMixin {
  bool isHidden = true;
  File uri = File("");
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'signup'.tr(),
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        leading: AppWidget.buildBackArrow(context: context),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 173,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        child: Container(
                      alignment: Alignment.center,
                      width: 96.0,
                      height: 96.0,
                      decoration: BoxDecoration(
                          image: uri.path.isEmpty
                              ? const DecorationImage(
                                  image: AssetImage(
                                      '${AppConstant.localImagePath}avatar.png'),
                                )
                              : DecorationImage(
                                  image: FileImage(uri),
                                )),
                    )),
                    Positioned(
                        top: 120.0,
                        left: width / 2 - 40,
                        child: SizedBox(
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(96),
                                color: AppColors.grey4,
                                border: Border.all(
                                    width: 2, color: AppColors.grey1)),
                            child: GestureDetector(
                                onTap: () {
                                  _getFromGallery();
                                },
                                child: SvgPicture.asset(
                                  alignment: Alignment.center,
                                  "${AppConstant.localImagePath}edit.svg",
                                )),
                          ),
                        )),
                  ],
                )),
            _buildLoginSection(),
          ],
        ),
      ),
    );
  }

  _buildLoginSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              AppWidget.svg('ic_user.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'User Name'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Full Name'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              AppWidget.svg('email.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'email'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'email'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),
          Row(
            children: [
              AppWidget.svg('lock.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'email'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  obscureText: isHidden,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'password'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: isHidden
                            ? const Icon(
                                Icons.visibility,
                              )
                            : const Icon(Icons.visibility_off),
                      )),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              AppWidget.svg('lock.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'email'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              height: 56.0,
              decoration: BoxDecoration(
                  color: AppColors.grey8,
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  maxLines: 1,
                  autofocus: false,
                  obscureText: isHidden,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'confirmpassword'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: isHidden
                            ? const Icon(
                                Icons.visibility,
                              )
                            : const Icon(Icons.visibility_off),
                      )),
                ),
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppColors.colorPrimary,
                elevation: 5,
                shadowColor: AppColors.grey8),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppConstant.pageHomeRoute);
            },
            child: Text('login'.tr()),
          ),
          const SizedBox(height: 50),
          RichText(
              text: TextSpan(
            style: const TextStyle(color: AppColors.black),
            /*defining default style is optional */

            children: <TextSpan>[
              TextSpan(
                  text: 'dont_have_account?'.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              TextSpan(
                  text: 'login'.tr(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppConstant.pageSignupRoute);
                    },
                  style: const TextStyle(
                      color: AppColors.colorPrimary,
                      decoration: TextDecoration.underline,
                      fontSize: 16)),
            ],
          ))
        ],
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        uri = imageFile;
      });
    }
  }
}

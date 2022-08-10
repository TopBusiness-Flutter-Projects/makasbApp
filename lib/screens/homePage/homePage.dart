import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/routes/app_routes.dart';
import 'package:makasb/screens/homePage/widget/coinsWidget.dart';
import 'package:makasb/screens/homePage/widget/homeWidget.dart';
import 'package:makasb/screens/homePage/widget/profileWidget.dart';
import 'package:makasb/screens/homePage/widget/socialWidget.dart';
import 'package:makasb/widgets/app_widgets.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int indexpage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        indexpage = index;
      });
    }

    List<Widget> screens = [
      const homeWidget(),
      const socialWidget(),
      const coinsWidget(),
      const profileWidget()
    ];

    return Container(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        _buildAppBar(context, "0"),
        Flexible(
          child: IndexedStack(index: indexpage, children: screens),
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.grey6,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '${AppConstant.localImagePath}home.svg',
              color: indexpage == 0 ? AppColors.colorPrimary : AppColors.grey6,
            ),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '${AppConstant.localImagePath}coin.svg',
              color: indexpage == 1 ? AppColors.colorPrimary : AppColors.grey6,
            ),
            label: 'Coins'.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '${AppConstant.localImagePath}social.svg',
              color: indexpage == 2 ? AppColors.colorPrimary : AppColors.grey6,
            ),
            label: 'Social'.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              '${AppConstant.localImagePath}user.svg',
              color: indexpage == 3 ? AppColors.colorPrimary : AppColors.grey6,
            ),
            label: 'Profile'.tr(),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: indexpage,
        selectedItemColor: AppColors.colorPrimary,
      ),
    ));
  }

  Widget _buildAppBar(BuildContext context, String notificationCount) {
    return AppBar(
        backgroundColor: AppColors.white,
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(.2),
                offset: const Offset(0.0, 1.0),
                blurRadius: 0)
          ]),
          padding: const EdgeInsetsDirectional.only(
            start: 0.0,
            bottom: 0.0,
          ),
          height: 50,
          alignment: Alignment.center,
          child: Center(
              child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 5),
                  Image.asset('${AppConstant.localImagePath}logo.png',
                      height: 30),
                  Expanded(flex: 1, child: Container()),
                  // give it width

                  Text(
                    'email'.tr(),
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.color5),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    '${AppConstant.localImagePath}dolar.svg',
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 5)
                ],
              )
            ],
          )),
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/routes/app_routes.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';

import 'package:makasb/colors/colors.dart';




class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,

      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                    //code for top button
                    ),
                const SizedBox(height: 250),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 225.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    '${AppConstant.localImagePath}logo.png'))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                       alignment: Alignment.bottomRight,
                        height: 250,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.bottomRight,

                              image: AssetImage(

                                    '${AppConstant.localImagePath}bottom_splash.png'),
                                )),
                      )),
                )
              ],
            ),
          )),
    );
  }
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacementNamed(AppConstant.pageLoginRoute)
    }) ;
  }
}

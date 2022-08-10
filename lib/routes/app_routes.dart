import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/screens/aboutpage/aboutpage.dart';
import 'package:makasb/screens/addsitePage/addsite_page.dart';
import 'package:makasb/screens/buypointpage/buypointpage.dart';
import 'package:makasb/screens/homePage/homePage.dart';
import 'package:makasb/screens/loginPage/login_page.dart';
import 'package:makasb/screens/settingpage/settingpage.dart';
import 'package:makasb/screens/signupPage/signup_page.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';

class AppRoutes {

  static Route<dynamic>? getRoutes(RouteSettings settings) {
    print('ROUTENAME${settings.name}');
    switch (settings.name) {
      case AppConstant.pageSplashRoute:
        return MaterialPageRoute(builder: (context) => const SplashPage());




      case AppConstant.pageLoginRoute:
        return MaterialPageRoute(builder: (context) =>
        const LoginPage()
        );

        case AppConstant.pageHomeRoute :
        return MaterialPageRoute(builder: (context) =>
        const homePage()
        );
      case AppConstant.pageSignupRoute :
        return MaterialPageRoute(builder: (context) =>
        const signuppage()
        );
      case AppConstant.pageAddSiteRoute :
        return MaterialPageRoute(builder: (context) =>
        const addsite_page()
        );

      case AppConstant.pageBuypointRoute :
        return MaterialPageRoute(builder: (context) =>
        const buyBointWidget()
        );
      case AppConstant.pagesettingRoute :
        return MaterialPageRoute(builder: (context) =>
        const settingpage()
        );
      case AppConstant.pageaboutRoute :
        return MaterialPageRoute(builder: (context) =>
        const aboutpage()
        );
    }
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/screens/aboutpage/aboutpage.dart';
import 'package:makasb/screens/addsitePage/addsite_page.dart';
import 'package:makasb/screens/buypointpage/buypointpage.dart';
import 'package:makasb/screens/homePage/homePage.dart';
import 'package:makasb/screens/loginPage/cubit/login_cubit.dart';
import 'package:makasb/screens/loginPage/login_page.dart';
import 'package:makasb/screens/settingpage/settingpage.dart';
import 'package:makasb/screens/signupPage/cubit/user_sign_up_cubit.dart';
import 'package:makasb/screens/signupPage/signup_page.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';

import '../screens/homePage/widget/homewidget/cubit/main_page_cubit.dart';
import '../screens/splashPage/cubit/splash_cubit.dart';

class AppRoutes {
  static late MainPageCubit mainPageCubit;


  static Route<dynamic>? getRoutes(RouteSettings settings) {
    print('ROUTENAME${settings.name}');
    switch (settings.name) {
      case AppConstant.pageSplashRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SplashCubit>(
            create: (context) => SplashCubit(),
            child: SplashPage(),
          ),
        );



      case AppConstant.pageLoginRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<LoginCubit>(
            create: (context) {
              LoginCubit cubit = LoginCubit();
              return cubit;
            },
            child: LoginPage(),
          );
        });

        case AppConstant.pageHomeRoute :
        return MaterialPageRoute(builder: (context) {
          return
             MultiBlocProvider(
            providers: [

    BlocProvider<MainPageCubit>(create: (context) {
    mainPageCubit = MainPageCubit();
    return mainPageCubit;
    }),


    ],
         child:homePage()
        );
        }

    );
      case AppConstant.pageSignupRoute :
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<UserSignUpCubit>(
            create: (context) {
              UserSignUpCubit cubit = UserSignUpCubit();
              return cubit;
            },
            child: signuppage(),
          );
        });

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

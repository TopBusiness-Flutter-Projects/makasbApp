import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/type.dart';
import 'package:makasb/screens/aboutpage/aboutpage.dart';
import 'package:makasb/screens/addsitePage/addsite_page.dart';
import 'package:makasb/screens/addsitePage/cubit/add_site_cubit.dart';
import 'package:makasb/screens/buypointpage/buypointpage.dart';
import 'package:makasb/screens/editprofilepage/cubit/user_edit_cubit.dart';
import 'package:makasb/screens/homePage/homePage.dart';
import 'package:makasb/screens/homePage/widget/profile_widget/cubit/profile_cubit.dart';
import 'package:makasb/screens/loginPage/cubit/login_cubit.dart';
import 'package:makasb/screens/loginPage/login_page.dart';
import 'package:makasb/screens/settingpage/cubit/setting_cubit.dart';
import 'package:makasb/screens/settingpage/settingpage.dart';
import 'package:makasb/screens/signupPage/cubit/user_sign_up_cubit.dart';
import 'package:makasb/screens/signupPage/signup_page.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';
import 'package:makasb/screens/type_screen/cubit/type_cubit.dart';

import '../models/payment_model.dart';
import '../screens/buypointpage/cubit/all_coins_page_cubit.dart';
import '../screens/countries_screen/countries_page.dart';
import '../screens/countries_screen/cubit/countries_cubit.dart';
import '../screens/editprofilepage/edit_profile_page.dart';
import '../screens/forgotpassword/forget_password.dart';
import '../screens/homePage/cubit/home_page_cubit.dart';
import '../screens/homePage/widget/coinswidget/cubit/coins_page_cubit.dart';
import '../screens/homePage/widget/homewidget/cubit/main_page_cubit.dart';
import '../screens/payment_screen/payment_page.dart';
import '../screens/postwebpage/post-web_page.dart';
import '../screens/sites/cubit/sites_page_cubit.dart';
import '../screens/sites/sitespage.dart';
import '../screens/splashPage/cubit/splash_cubit.dart';
import '../screens/type_screen/type_page.dart';

class AppRoutes {
  static late MainPageCubit mainPageCubit;
  static late CoinsPageCubit coinsPageCubit;

  static late HomePageCubit homePageCubit;
  static late ProfileCubit profileCubit;

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
      case AppConstant.pageeditProfileRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<EditprofileCubit>(
            create: (context) {
              EditprofileCubit cubit = EditprofileCubit();
              return cubit;
            },
            child:  Editprofilepage(),
          );
        });
      case AppConstant.pageHomeRoute:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(providers: [
            BlocProvider<HomePageCubit>(create: (context) {
              homePageCubit = HomePageCubit();
              return homePageCubit;
            }),
            BlocProvider<MainPageCubit>(create: (context) {
              mainPageCubit = MainPageCubit();
              return mainPageCubit;
            }),
            BlocProvider<CoinsPageCubit>(create: (context) {
              coinsPageCubit = CoinsPageCubit();
              return coinsPageCubit;
            }),
            BlocProvider<ProfileCubit>(create: (context) {
              profileCubit = ProfileCubit();
              return profileCubit;
            }),
          ], child: homePage());
        });
      case AppConstant.pageSignupRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<UserSignUpCubit>(
            create: (context) {
              UserSignUpCubit cubit = UserSignUpCubit();
              return cubit;
            },
            child: signuppage(),
          );
        });

      case AppConstant.pageAddSiteRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<AddSiteCubit>(
            create: (context) => AddSiteCubit(),
            child: AddSitePage(),
          );
        });

      case AppConstant.pageBuypointRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<AllCoinsPageCubit>(
            create: (context) => AllCoinsPageCubit(),
            child: buyBointWidget(),
          );
        });
      case AppConstant.pagesettingRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<SettingCubit>(
            create: (context) => SettingCubit(),
            child: const settingpage(),
          );
        });

      case AppConstant.pageCountriesRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<CountriesCubit>(
            create: (context) => CountriesCubit(),
            child: const CountriesPage(),
          );
        });
      case AppConstant.pageTypeRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<TypeCubit>(
            create: (context) => TypeCubit(),
            child: const TypePage(),
          );
        });
        case AppConstant.pagePaymentRoute:
      PaymentDataModel paymentDataModel = settings.arguments as PaymentDataModel;


      return MaterialPageRoute(
          builder: (context) => paymetPage(
              paymentDataModel: paymentDataModel
          ));
      case AppConstant.pagePostRoute:
        String url = settings.arguments as String;


        return MaterialPageRoute(
            builder: (context) => PostWebPage(
                url: url
            ));
      case AppConstant.pageSitesRoute:
        TypeModel typeModel = settings.arguments as TypeModel;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SitesPageCubit(),
              child: SitesWidget(
                typeModel: typeModel,
              ),
            ));
      case AppConstant.resetPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => ForgetPasswordScreen(
            ));

    }
  }
}

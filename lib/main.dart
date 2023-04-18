import 'dart:async';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/preferences/preferences.dart';
import 'package:makasb/routes/app_routes.dart';
import 'package:makasb/screens/signupPage/cubit/user_sign_up_cubit.dart';
import 'package:makasb/screens/signupPage/signup_page.dart';
import 'package:uni_links/uni_links.dart';

import 'constants/app_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
    ),
  );

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      path: 'assets/lang',
      saveLocale: false,
      startLocale: const Locale('ar', ''),
      fallbackLocale: const Locale('ar', ''),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navKey = GlobalKey<NavigatorState>();

  Uri? _currentURI;
  Object? _err;

  StreamSubscription? _streamSubscription;
  @override
  Widget build(BuildContext context) {
    Preferences.instance.getAppSetting().then((value) =>
        {EasyLocalization.of(context)!.setLocale(Locale(value.lang))});

    return MaterialApp(
      navigatorKey: _navKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: "/",
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
            fontFamily: 'normal',
            checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.all(AppColors.colorPrimary),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)))),
        onGenerateRoute: AppRoutes.getRoutes,
     );
  }
  @override
  void initState() {
    super.initState();
    _incomingLinkHandler();
  }
  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (!mounted) {
          return;
        }
        //debugPrint('Received URI: $uri');
        setState(() {
          _currentURI = uri;
          // print("llllkkoii");
          // print(_currentURI);
          _navKey
              .currentState!.push(MaterialPageRoute(builder: (context) {
            return BlocProvider<UserSignUpCubit>(
              create: (context) {
                UserSignUpCubit cubit = UserSignUpCubit();
                return cubit;
              },
              child: signuppage(initialURI:_currentURI!),
            );
          }));
          _err = null;
        });
        // 3
      }, onError: (Object err) {
        if (!mounted) {
          return;
        }
      //  debugPrint('Error occurred: $err');
        setState(() {
          _currentURI = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

}

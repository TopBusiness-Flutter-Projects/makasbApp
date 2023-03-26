import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/routes/app_routes.dart';
import 'package:makasb/screens/splashPage/splash_page.dart';

import 'package:makasb/colors/colors.dart';
import 'package:uni_links/uni_links.dart';

import 'cubit/splash_cubit.dart';




class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _initialURILinkHandled = false;
  Uri? _initialURI;
  Uri? _currentURI;
  Object? _err;

  StreamSubscription? _streamSubscription;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is OnUserModelGet) {
           // print("state.userModel.user.userType");
          //  print(state.userModel.data.);
            Future.delayed(const Duration(seconds: 2)).then(
                  (value) => {


                      Navigator.of(context)
                          .pushReplacementNamed(AppConstant.pageHomeRoute)

                },
            );
          } else if (state is NoUserFound) {
            Future.delayed(const Duration(seconds: 2)).then(
                  (value) => {
                    if(_initialURI==null){
                Navigator.of(context)
                    .pushReplacementNamed(AppConstant.pageLoginRoute)
              }
                    else{
                      Navigator.of(context)
                          .pushReplacementNamed(AppConstant.pageSignupRoute,arguments: _initialURI)
                    }
                  },
            );
          }
        },
        builder: (context, state) {
          return  MaterialApp(
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
          ),
    )
    );
        });
  }

  @override
  void initState() {
    super.initState();
    _initURIHandler();
    _incomingLinkHandler();
  }
  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
  Future<void> _initURIHandler() async {
    // 1
   // print("dddd");
   //  print(_initialURI);
   //  if(_initialURI!=null){
   //    setState(() {
   //      _initialURI=null;
   //      _initURIHandler();
   //    });
   //
   //  }
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;
      // 2
      Fluttertoast.showToast(
          msg: "Invoked _initURIHandler",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
      try {
        // 3
        final initialURI = await getInitialUri();
        // 4
        if (initialURI != null) {
          // debugPrint("Initial URI received $initialURI");
          print("ddkdkkdkdkdkdkfjgjgjhg");
          print(initialURI);
          if (!mounted) {
            return;
          }
          setState(() {
            _initialURI = initialURI;
          });
        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException {
        // 5
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) {
        // 6
        if (!mounted) {
          return;
        }
        debugPrint('Malformed Initial URI received');
        setState(() => _err = err);
      }
    }
  }

  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (!mounted) {
          return;
        }
        debugPrint('Received URI: $uri');
        setState(() {
          _currentURI = uri;
          _err = null;
        });
        // 3
      }, onError: (Object err) {
        if (!mounted) {
          return;
        }
        debugPrint('Error occurred: $err');
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

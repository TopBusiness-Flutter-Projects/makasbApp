
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/login_model.dart';
import 'package:makasb/models/user_model.dart';
import 'package:makasb/preferences/preferences.dart';
import 'package:makasb/remote/service.dart';
import 'package:bloc/bloc.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'dart:async';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  late ServiceApi api;

  bool isLoginValid = false;

  LoginModel loginModel = LoginModel();

  bool ishidden=true;


  LoginCubit()
      : super(LoginInitial()) {
    api = ServiceApi();





  }
  hide() {
    print("sss${ishidden}");
    ishidden=!ishidden;
    print("seess${ishidden}");
    emit(PasswordHidden(ishidden));
  }

  void login(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());

    try {
      UserModel response = await api.login(loginModel);


      if (response.status.status == 200) {
        Navigator.pop(context);
        response.data.isLoggedIn = true;
        Preferences.instance.setUser(response).then((value) {
          emit(OnLoginSuccess(response));
        });

      } else if (response.status.status == 400) {
        Navigator.pop(context);
        emit(OnSignUp(loginModel));
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: response.status.msg, // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM, // location
            timeInSecForIosWeb: 1 // duration
        );
        print("errorCode=>${response.status.status}");
      }
    } catch (e) {
      print("error${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }
  void checkValidLoginData() {
    if (loginModel.isDataValid()) {
      isLoginValid = true;
      emit(OnLoginVaild());
    } else {
      isLoginValid = false;

      emit(OnLoginVaildFaild());
    }
  }
}

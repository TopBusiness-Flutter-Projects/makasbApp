import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/login_model.dart';
import 'package:makasb/models/user_model.dart';
import 'package:makasb/preferences/preferences.dart';
import 'package:makasb/remote/service.dart';

import 'package:bloc/bloc.dart';
import 'package:makasb/widgets/app_widgets.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late ServiceApi api;

  bool isLoginValid = false;

  LoginModel loginModel = LoginModel();


  LoginCubit()
      : super(LoginInitial()) {
    api = ServiceApi();


    _checkValidLoginData() {
      if (loginModel.isDataValid()) {
        isLoginValid = true;
        emit(OnLoginVaild());
      } else {
        isLoginValid = false;

        emit(OnLoginVaildFaild());
      }
    }


  }

  void login(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());

    try {
      UserModel response = await api.login(loginModel);
      Navigator.of(context).pushReplacementNamed(AppConstant.pageHomeRoute);


      if (response.status.status == 200) {
        response.data.isLoggedIn = true;
        Preferences.instance.setUser(response).then((value) {
          emit(OnLoginSuccess(response));
        });

      } else if (response.status.status == 406) {
        emit(OnSignUp(loginModel));
      } else {
        print("errorCode=>${response.status.status}");
      }
    } catch (e) {
      print("error${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }
}

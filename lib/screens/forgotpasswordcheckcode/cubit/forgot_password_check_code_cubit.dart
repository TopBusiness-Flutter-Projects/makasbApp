import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:makasb/models/status_resspons.dart';
import 'package:meta/meta.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/user_model.dart';
import 'package:makasb/preferences/preferences.dart';
import 'package:makasb/remote/service.dart';
import 'package:bloc/bloc.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'dart:async';

part 'forgot_password_check_code_state.dart';

class ForgotPasswordCheckCodeCubit extends Cubit<ForgotPasswordCheckCodeState> {
  late ServiceApi api;

  bool isForgotPasswordValid = false;

  late String email;
  late String code;

  ForgotPasswordCheckCodeCubit() : super(ForgotPasswordInitial()) {
    api = ServiceApi();
  }

  void forgotPassword(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());

    try {
      StatusResponse response = await api.checkcode(email,code);

      Navigator.pop(context);
      if (response.status == 200) {
        emit(OnForgotPasswordSuccess(response));
      } else {
        Fluttertoast.showToast(
            msg: 'Invaild Code'.tr(), // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM, // location
            timeInSecForIosWeb: 1 // duration
            );

        print("errorCode=>${response.status}");
      }
    } catch (e) {
      print("error${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }

  void checkValidForgotPasswordData() {
    if (code.isNotEmpty) {
      isForgotPasswordValid = true;
      emit(OnForgotPasswordVaild());
    } else {
      isForgotPasswordValid = false;

      emit(OnForgotPasswordVaildFaild());
    }
  }
}

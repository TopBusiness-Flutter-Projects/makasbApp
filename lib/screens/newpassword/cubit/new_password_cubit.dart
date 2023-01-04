import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/models/status_resspons.dart';

import '../../../models/new_password_model.dart';
import '../../../models/user_model.dart';
import '../../../models/user_sign_up_model.dart';
import '../../../preferences/preferences.dart';
import '../../../remote/service.dart';
import '../../../widgets/app_widgets.dart';
import 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {

  NewPasswordModel model = NewPasswordModel();
  bool isDataValid = false;
  bool ishidden=true;
  late ServiceApi api;
 

  NewPasswordCubit() : super(NewPasswordInitial()) {
    api = ServiceApi();
  }


  checkData() {
    if (model.isDataValid()) {
      isDataValid = true;
    } else {
      isDataValid = false;
    }

    emit(UserDataValidation(isDataValid));
  }
  hide() {
    print("sss${ishidden}");
    ishidden=!ishidden;
    print("seess${ishidden}");
    emit(PasswordHidden(ishidden));
  }

  newPassword(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    try {
      StatusResponse response = await api.newpassword(model);
      if (response.status == 200) {

          Navigator.pop(context);
          emit(OnNewPasswordSuccess());

      } else {
        Navigator.pop(context);
        emit(OnError(response.msg));
      }
    } catch (e) {
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }

  // updateProfile(BuildContext context, String user_token) async {
  //   AppWidget.createProgressDialog(context, 'wait'.tr());
  //   try {
  //     UserModel response = await api.updateProfile(model, user_token);
  //     response.data.isLoggedIn = true;
  //     print("Dkdkdkdk" + response.status.status.toString());
  //     if (response.status.status == 200) {
  //       response.data.token = user_token;
  //       Preferences.instance.setUser(response).then((value) {
  //         Navigator.pop(context);
  //         emit(OnSignUpSuccess());
  //       });
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);
  //     OnError(e.toString());
  //   }
  // }

  void updateUserDataUi() {
    Preferences.instance.getUserModel().then((value) {
      // if (value.user.isLoggedIn) {
      //   model.firstName = value.user.firstName;
      //   model.lastName = value.user.lastName;
      //   model.email = value.user.email;
      //   model.cityId = value.user.city.id;
      //   model.imagePath = value.user.image;
      //   updateSelectedCity(value.user.city);
      //   updateBirthDate(date: value.user.birthdate);
      //   controllerFirstName.text = model.firstName;
      //   controllerLastName.text = model.lastName;
      //   controllerEmail.text = model.email;
      //
      //   emit(OnUserDataGet());
      //   emit(UserPhotoPicked(model.imagePath));
      // }
    });
  }
}

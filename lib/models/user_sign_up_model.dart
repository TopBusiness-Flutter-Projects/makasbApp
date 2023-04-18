import 'dart:core';

import 'package:email_validator/email_validator.dart';

class UserSignUpModel {
  String imagePath = '';
  String user_name = '';
  String phone = '';
  int id = 0;
  String email = '';
  String password = '';

  String password_confirmation = '';

  bool isDataValid() {
   // print(phone);
    //print(id.toString());
    if (user_name.isNotEmpty &&
        EmailValidator.validate(email) &&
        password.isNotEmpty &&
        password_confirmation.isNotEmpty &&
        password_confirmation == password &&
        phone.isNotEmpty &&
        id != 0) {
      return true;
    }

    return false;
  }
}

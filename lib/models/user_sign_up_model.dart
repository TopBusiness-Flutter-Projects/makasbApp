import 'package:email_validator/email_validator.dart';

class UserSignUpModel {
  String imagePath = '';
  String user_name = '';
  String email = '';
  String password = '';
  String password_confirmation = '';


  bool isDataValid() {
    if (user_name.isNotEmpty &&

        EmailValidator.validate(email) &&
        password.isNotEmpty&&password_confirmation.isNotEmpty&&password_confirmation==password) {

      return true;
    }

    return false;
  }
}

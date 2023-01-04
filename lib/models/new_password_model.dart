import 'package:email_validator/email_validator.dart';

class NewPasswordModel {
  String email = '';
  String password = '';
  String confirm_password = '';
  String code='';

  bool isDataValid() {
    if (EmailValidator.validate(email) &&
        password.isNotEmpty &&
        confirm_password.isNotEmpty &&
        confirm_password == password) {
      return true;
    }

    return false;
  }
}

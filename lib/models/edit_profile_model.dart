import 'package:email_validator/email_validator.dart';

class EditProfileModel {
  String imagePath = '';
  String user_name = '';
  String email = '';



  bool isDataValid() {
    if (user_name.isNotEmpty &&

        EmailValidator.validate(email)
       ) {

      return true;
    }

    return false;
  }
}

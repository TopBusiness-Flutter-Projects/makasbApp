import 'package:email_validator/email_validator.dart';

class EditProfileModel {
  String imagePath = '';
  String user_name = '';
  String email = '';

  int id=0;

  String phone='';



  bool isDataValid() {
    if (user_name.isNotEmpty &&
phone.isNotEmpty&&
        EmailValidator.validate(email)&&id!=0

       ) {

      return true;
    }

    return false;
  }
}

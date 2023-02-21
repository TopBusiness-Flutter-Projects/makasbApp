
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/country_model.dart';

@immutable
abstract class UserSignUpState {}

class UserSignUpInitial extends UserSignUpState {}
class OnCountrySelected extends UserSignUpState {
 CountryModel countryModel;

  OnCountrySelected(this.countryModel);
}
class UserPhotoPicked extends UserSignUpState {
  String imagePath;

  UserPhotoPicked(this.imagePath);
}

class UserBirthDateSelected extends UserSignUpState {
  String date;

  UserBirthDateSelected(this.date);
}

class UserDataValidation extends UserSignUpState {
  bool valid;

  UserDataValidation(this.valid);
}

class PasswordHidden extends UserSignUpState{
  bool valid;

  PasswordHidden(this.valid);
}



class IsLoading extends UserSignUpState {}

class OnSignUpSuccess extends UserSignUpState {

}

class OnUserDataGet extends UserSignUpState {

}
class OnError extends UserSignUpState {
  String error;
  OnError(this.error);
}
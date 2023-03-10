
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/country_model.dart';

@immutable
abstract class EditprofileState {}

class EditprofileUpInitial extends EditprofileState {}

class UserPhotoPicked extends EditprofileState {
  String imagePath;

  UserPhotoPicked(this.imagePath);
}

class UserBirthDateSelected extends EditprofileState {
  String date;

  UserBirthDateSelected(this.date);
}

class UserDataValidation extends EditprofileState {
  bool valid;

  UserDataValidation(this.valid);
}




class IsLoading extends EditprofileState {}

class OnSignUpSuccess extends EditprofileState {

}
class OnCountrySelected extends EditprofileState {
  CountryModel countryModel;

  OnCountrySelected(this.countryModel);
}

class OnUserDataGet extends EditprofileState {

}
class OnError extends EditprofileState {
  String error;
  OnError(this.error);
}
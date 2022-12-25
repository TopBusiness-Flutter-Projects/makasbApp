
import 'package:flutter/cupertino.dart';
import 'package:makasb/models/country_model.dart';
import 'package:makasb/models/type.dart';

@immutable
abstract class AddSiteState {}
class OnCitySelected extends AddSiteState {
  CountryModel cityModel;

  OnCitySelected(this.cityModel);
}
class OnTypeSelected extends AddSiteState {
  TypeModel typeModel;

  OnTypeSelected(this.typeModel);
}
class OnUserDataGet extends AddSiteState {

}
class AddSiteInitial extends AddSiteState {}

class AddSiteDataValidation extends AddSiteState {
  bool valid;
  AddSiteDataValidation(this.valid);

}
class OnSignUpSuccess extends AddSiteState {

}
class OnError extends AddSiteState {
  String error;
  OnError(this.error);
}

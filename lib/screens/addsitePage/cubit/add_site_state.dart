
import 'package:flutter/cupertino.dart';
import 'package:makasb/models/country_model.dart';
import 'package:makasb/models/type.dart';

@immutable
abstract class AddSiteState {}
class OnCountrySelected extends AddSiteState {
  List<CountryModel> countryModel;

  OnCountrySelected(this.countryModel);
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
class OnAddPostSuccess extends AddSiteState {

}
class OnError extends AddSiteState {
  String error;
  OnError(this.error);
}

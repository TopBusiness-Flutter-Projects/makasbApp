

import 'package:flutter/cupertino.dart';

import '../../../models/country_model.dart';

@immutable
abstract class CountriesState {}

class IsLoading extends CountriesState {}

class OnDataSuccess extends CountriesState {
  List<CountryModel> data;
  OnDataSuccess(this.data);
}

class OnError extends CountriesState {
  String error;

  OnError(this.error);
}

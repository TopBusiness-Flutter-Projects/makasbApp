
import 'package:makasb/models/status_resspons.dart';

import 'country_model.dart';

class CountryDataModel{
  late List<CountryModel> data;
  late StatusResponse status;

  CountryDataModel.fromJson(Map<String,dynamic> json){
    data = [];
    json['data'].forEach((v)=>data.add(CountryModel.fromJson(v)));
    status = StatusResponse.fromJson(json);
  }
}
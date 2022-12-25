
import 'package:makasb/models/status_resspons.dart';

import 'country_model.dart';
import 'package:makasb/models/type.dart';

class TypeDataModel{
  late List<TypeModel> data;
  late StatusResponse status;

  TypeDataModel.fromJson(Map<String,dynamic> json){
    data = [];
    json['data'].forEach((v)=>data.add(TypeModel.fromJson(v)));
    status = StatusResponse.fromJson(json);
  }
}
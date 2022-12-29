import 'package:makasb/models/points.dart';
import 'package:makasb/models/sites.dart';
import 'package:makasb/models/status_resspons.dart';
import 'package:makasb/models/type.dart';
class PointsDataModel {

  late List<Points> data;
  late StatusResponse status;


  PointsDataModel(
    );
  PointsDataModel.fromJson(Map<String,dynamic> json){
    data = [];
    json['data'].forEach((v)=>data.add(Points.fromJson(v)));
    status = StatusResponse.fromJson(json);
  }

}





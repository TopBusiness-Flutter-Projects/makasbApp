import 'package:makasb/models/sites.dart';
import 'package:makasb/models/status_resspons.dart';
import 'package:makasb/models/type.dart';
class MySites {

  late List<Sites> data;
  late StatusResponse status;


 MySites(
    );
  MySites.fromJson(Map<String,dynamic> json){
    data = [];
    json['data'].forEach((v)=>data.add(Sites.fromJson(v)));
    status = StatusResponse.fromJson(json);
  }

}





import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';
class Points {


 late int id;
 late int number_of_points;
 late int price;

 late String createdAt;
 late String updatedAt;


 Points(
    );

 Points.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??0;
    number_of_points = json['number_of_points'] ??0;
    price = json['price'] ??0;

    createdAt = json['created_at'] ??"";
    updatedAt = json['updated_at'] ??"";
  }
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id'] = this.id;
   data['number_of_points'] = this.number_of_points;
   data['price'] = this.price;

   data['created_at'] = this.createdAt;
   data['updated_at'] = this.updatedAt;
   return data;
 }
}





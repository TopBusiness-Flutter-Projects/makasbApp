import 'package:makasb/models/sites.dart';

class User {
  late int? id;
  late String? userName;
  late int? balance;
  late String? email;
  late String? image;
  late String? createdAt;
  late String? updatedAt;
  late List<Sites> sites;
  late bool isLoggedIn = false;

  User(
   );

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    balance = json['balance'];
    email = json['email'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['sites'] != null) {
      sites = <Sites>[];
      json['sites'].forEach((v) {
        sites.add(new Sites.fromJson(v));
      });
    }
  }
  static Map<String,dynamic> toJson(User user){
    return {
      'id'         :user.id,
      'user_name' :user.userName,
      'balance'  :user.balance,
      'email'      :user.email,
      'image'      :user.image,
      'created_at'  :user.createdAt,
      'updated_at'  :user.updatedAt,
      'sites'       :  user.sites.map((v) => v.toJson()).toList()
    ,
    };
  }
}

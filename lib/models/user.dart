import 'package:makasb/models/sites.dart';

import 'country_model.dart';

class User {
  late int? id;
  late String? userName;
  late int? balance;
  late String? email;
  late String? phone;
  late String? image;
  late String? createdAt;
  late String? updatedAt;
  late String? country;
  late CountryModel country_data;

  // late List<Sites> sites;
  late bool isLoggedIn = false;
  late String token;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    balance = json['balance'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    country_data = CountryModel.fromJson(json['country_data']);

    // if (json['sites'] != null) {
    //   sites = <Sites>[];
    //   json['sites'].forEach((v) {
    //     sites.add(Sites.fromJson(v));
    //   });
    // }
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      'id': user.id,
      'user_name': user.userName,
      'balance': user.balance,
      'email': user.email,
      'image': user.image,
      'phone': user.phone,
      'created_at': user.createdAt,
      'country': user.country,
      'updated_at': user.updatedAt,
      'token': user.token,
      'country_data': CountryModel.toJson(user.country_data)

      // 'sites'       :  user.sites.map((v) => v.toJson()).toList()
    };
  }
}

import 'package:makasb/models/status_resspons.dart';
import 'package:makasb/models/user.dart';

class UserModel {
  late User data;
  late StatusResponse status;

  UserModel() {
    data = User();
    data.isLoggedIn = false;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    data =json['data']!=null? User.fromJson(json['data']):User();
    status = StatusResponse.fromJson(json);
  }

  Map<String, dynamic> toJson(UserModel user) {
    return {'data': User.toJson(user.data)};
  }
}

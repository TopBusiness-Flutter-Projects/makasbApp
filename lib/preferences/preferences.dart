import 'dart:convert';

import 'package:makasb/models/user.dart';
import 'package:makasb/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_settings.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;


  Future<void> setUser(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', json.encode(userModel.toJson(userModel)));
  }

  Future<UserModel> getUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');
    UserModel userModel;
    if (jsonData != null) {

      userModel = UserModel.fromJson(jsonDecode(jsonData));
      userModel.data.isLoggedIn = true;
    }else{
      userModel = UserModel();
      User user = User();
      userModel.data = user;
      userModel.data.isLoggedIn = false;

    }

    return userModel;
  }

  clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
  Future<void> setAppSetting(AppSettings appSettings) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'appSetting', json.encode(appSettings.toJson(appSettings)));
  }

  Future<AppSettings> getAppSetting() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('appSetting');
    AppSettings appSettings;
    if (jsonData == null) {
      appSettings = AppSettings(lang: 'ar');
    } else {
      appSettings = AppSettings.fromJson(jsonData);
    }

    return appSettings;
  }
}

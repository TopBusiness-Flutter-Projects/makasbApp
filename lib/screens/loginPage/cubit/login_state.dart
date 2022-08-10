import 'package:flutter/cupertino.dart';
import 'package:makasb/models/login_model.dart';
import 'package:makasb/models/user_model.dart';




@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {


  LoginInitial();
}



class OnLoginVaild extends LoginState {
}

class OnLoginVaildFaild extends LoginState {
}



class OnLoginSuccess extends LoginState {
  UserModel userModel;

  OnLoginSuccess(this.userModel);
}

class OnError extends LoginState {
  String error;
  OnError(this.error);
}

class OnSignUp extends LoginState {
  LoginModel loginModel;
  OnSignUp(this.loginModel);
}




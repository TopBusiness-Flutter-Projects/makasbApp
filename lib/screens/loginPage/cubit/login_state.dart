
part of 'login_cubit.dart';



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




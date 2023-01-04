
part of 'forgot_password_cubit.dart';



@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {


  ForgotPasswordInitial();
}



class OnForgotPasswordVaild extends ForgotPasswordState {
}

class OnForgotPasswordVaildFaild extends ForgotPasswordState {
}



class OnForgotPasswordSuccess extends ForgotPasswordState {
  StatusResponse statusResponse;

  OnForgotPasswordSuccess(this.statusResponse);
}

class OnError extends ForgotPasswordState {
  String error;
  OnError(this.error);
}






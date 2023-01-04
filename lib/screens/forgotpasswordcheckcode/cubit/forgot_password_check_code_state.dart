
part of 'forgot_password_check_code_cubit.dart';



@immutable
abstract class ForgotPasswordCheckCodeState {}

class ForgotPasswordInitial extends ForgotPasswordCheckCodeState {


  ForgotPasswordInitial();
}



class OnForgotPasswordVaild extends ForgotPasswordCheckCodeState {
}

class OnForgotPasswordVaildFaild extends ForgotPasswordCheckCodeState {
}



class OnForgotPasswordSuccess extends ForgotPasswordCheckCodeState {
  StatusResponse statusResponse;

  OnForgotPasswordSuccess(this.statusResponse);
}

class OnError extends ForgotPasswordCheckCodeState {
  String error;
  OnError(this.error);
}






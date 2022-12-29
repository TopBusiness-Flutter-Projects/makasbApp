part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class MoreInitial extends ProfileState {

}
class OnSettingModelGet extends ProfileState {
  SettingModel settingModel;
  OnSettingModelGet(this.settingModel);
}

class OnLoading extends ProfileState {}
class OnError extends ProfileState {
  String error;
  OnError(this.error);
}

class OnUserModelGet extends ProfileState {
  UserModel userModel;
  OnUserModelGet(this.userModel);
}

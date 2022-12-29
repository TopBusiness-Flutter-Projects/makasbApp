part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class MoreInitial extends SettingState {

}
class OnSettingModelGet extends SettingState {
  SettingModel settingModel;
  OnSettingModelGet(this.settingModel);
}

class OnLoading extends SettingState {}
class OnError extends SettingState {
  String error;
  OnError(this.error);
}

class OnUserModelGet extends SettingState {
  UserModel userModel;
  OnUserModelGet(this.userModel);
}

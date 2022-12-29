import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../../models/setting_model.dart';
import '../../../../../models/user_model.dart';
import '../../../../../preferences/preferences.dart';
import '../../../../../remote/service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  late UserModel userModel;

  late ServiceApi api;
  late SettingModel settingModel;

  ProfileCubit() : super(MoreInitial()) {
    api = ServiceApi();

    getSetting();
  }

  void getUserModel() async {
    userModel = await Preferences.instance.getUserModel();

    emit(OnUserModelGet(userModel));
  }

  void onUserDataUpdated(UserModel userModel) {
    emit(OnUserModelGet(userModel));
  }

  getSetting() async {
    emit(OnLoading());
    settingModel=await api.getSetting();
    print("d;ldldl${settingModel.code}");
    emit(OnSettingModelGet(settingModel));
  }
}

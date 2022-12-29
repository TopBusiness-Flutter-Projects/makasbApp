import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../../models/setting_model.dart';
import '../../../../../models/user_model.dart';
import '../../../../../preferences/preferences.dart';
import '../../../../../remote/service.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {

  late ServiceApi api;
  late SettingModel settingModel;

  SettingCubit() : super(MoreInitial()) {
    api = ServiceApi();

    getSetting();
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

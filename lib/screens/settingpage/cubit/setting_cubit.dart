import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

import '../../../../../models/setting_model.dart';
import '../../../../../models/user_model.dart';
import '../../../../../preferences/preferences.dart';
import '../../../../../remote/service.dart';
import '../../../widgets/app_widgets.dart';

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
  deleteaccount(BuildContext context) async {
    try {
      getUserData().then((value) async {
        AppWidget.createProgressDialog(context, 'wait'.tr());
        await api.logout(value.data.token, value.data.id!);
        Navigator.pop(context);
        emit(OnLogOutSuccess());
      });
    } catch (e) {
      print("Logout=>${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }

  logout(BuildContext context) async {
    try {
      getUserData().then((value) async {
        AppWidget.createProgressDialog(context, 'wait'.tr());
        await api.logout(value.data.token, value.data.id!);
        Navigator.pop(context);
        emit(OnLogOutSuccess());
      });
    } catch (e) {
      print("Logout=>${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }
  Future<UserModel> getUserData() async {
    return await Preferences.instance.getUserModel();
  }
}

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../models/mysites.dart';
import '../../../../../models/points.dart';
import '../../../../../models/points_data.dart';
import '../../../../../models/slider.dart';
import '../../../../../models/slider_data_model.dart';
import '../../../../../models/status_resspons.dart';
import '../../../../../models/user_model.dart';
import '../../../../../preferences/preferences.dart';
import '../../../../../remote/service.dart';
import '../../../models/payment_model.dart';
import '../../../remote/notificationlisten.dart';
import '../../../widgets/app_widgets.dart';

part 'sites_page_state.dart';

class SitesPageCubit extends Cubit<SitesPageState> {
  late List<Sites> projects = [];
  late ServiceApi api;
  UserModel? userModel;
  TypeModel? typemodel;

  SitesPageCubit() : super(IsLoadingData()) {
    api = ServiceApi();
    getUserData().then((value) => getData(typemodel!.id));


    // getCategories();
  }

  Future<UserModel?> getUserData() async {
    userModel = await Preferences.instance.getUserModel();
    return userModel;
  }

  void getData(int type_id) async {
    try {
      projects.clear();
      emit(IsLoadingData());

      MySites home = await api.getSitesData(userModel!.data.token, type_id);
      if (home.status.status == 200) {
        projects = home.data;
        emit(OnDataSuccess(projects));
      } else {}
    } catch (e) {
      print("ldlldkdkkd${e.toString()}");
      emit(OnError(e.toString()));
    }
  }

  void onErrorData(String error) {
    emit(OnError(error));
  }

  void sendOrder(BuildContext context, int site_id) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());

    try {
      StatusResponse response = await api.checkSites(site_id, userModel!);
      Navigator.pop(context);

      if (response.status == 200) {
        emit(OnOrderSuccess(response));
      } else {}
    } catch (e) {
      print("error${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }

  updateUserData(context) async {
    await api.getProfileByToken(userModel!.data.token).then((value) {
      value.data.token = userModel!.data.token;
      Preferences.instance.setUser(value);
      NotificationsBloc.instance.newNotification("new");
    });
  }

  void remove(int index) {
    projects.removeAt(index);
    emit(OnDataSuccess(projects));
  }
}

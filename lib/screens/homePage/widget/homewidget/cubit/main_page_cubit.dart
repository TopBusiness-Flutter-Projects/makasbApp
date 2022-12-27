import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/models/sites.dart';

import '../../../../../models/mysites.dart';
import '../../../../../models/slider.dart';
import '../../../../../models/slider_data_model.dart';
import '../../../../../models/user_model.dart';
import '../../../../../preferences/preferences.dart';
import '../../../../../remote/service.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {

  late List<Sites> projects = [];
  late List<SliderModel> sliders = [];
  late ServiceApi api;
  UserModel? userModel;

  MainPageCubit() : super(IsLoadingData()) {
    api = ServiceApi();
    getUserData1().then((value) => getData());
    getUserData();

    getSlider();

   // getCategories();
  }
   Future<UserModel?> getUserData1() async {
    userModel = await Preferences.instance.getUserModel();
   return userModel;
  }
  void getUserData() async {
    userModel = await Preferences.instance.getUserModel();
    emit(UserData(userModel!));
    //getData();
  }






  void getData() async {
    try {
      projects.clear();
      emit(IsLoadingData());
      String user_id = '';
      if (userModel!.data.isLoggedIn) {
        user_id = userModel!.data.id.toString();
      }

      MySites home = await api.getmySitesData(
        user_id
      );
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

  getSlider() async {
    try {
      SliderDataModel response = await api.getSliders();
      if (response.status.status == 200) {
        sliders = response.data;

        emit(OnSliderDataSuccess(sliders));
      } else {
        OnError("error data");
      }
    } catch (error) {
      OnError(error.toString());
    }
  }


}

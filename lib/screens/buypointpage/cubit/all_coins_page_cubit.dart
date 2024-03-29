import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/models/sites.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

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

part 'all_coins_page_state.dart';

class AllCoinsPageCubit extends Cubit<AllCoinsPageState> {

  late List<Points> projects = [];
  late ServiceApi api;
  UserModel? userModel;

  AllCoinsPageCubit() : super(IsLoadingData()) {
    api = ServiceApi();
    getUserData().then((value) => getData());
   // getUserData();


   // getCategories();
  }
   Future<UserModel?> getUserData() async {
    userModel = await Preferences.instance.getUserModel();
   return userModel;
  }







  void getData() async {
    try {
      projects.clear();
      emit(IsLoadingData());
      String user_id = '';
      if (userModel!.data.isLoggedIn) {
        user_id = userModel!.data.id.toString();
      }

      PointsDataModel home = await api.getAllPoints(
        userModel!.data.token
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
  void sendOrder(BuildContext context,String points) async {
    String text="want_convert".tr()+"("+points+ ")"+"my_email".tr()+"("+userModel!.data.email!+")";
    var   url = "https://wa.me/?$text";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';

    }
    // AppWidget.createProgressDialog(context, 'wait'.tr());
    //
    //
    // try {
    //   PaymentDataModel response = await api.buyPoint(point_id,userModel!);
    //   Navigator.pop(context);
    //
    //   if (response.status.status == 200) {
    //
    //     emit(OnOrderSuccess(response));
    //
    //
    //   } else {
    //
    //   }
    // } catch (e) {
    //   print("error${e.toString()}");
    //   Navigator.pop(context);
    //   emit(OnError(e.toString()));
    // }
  }
  updateUserData(context) async {
    await api.getProfileByToken(userModel!.data.token).then((value) {
      value.data.token=userModel!.data.token;
      Preferences.instance.setUser(value);
      NotificationsBloc.instance.newNotification("new");


    });
  }


}

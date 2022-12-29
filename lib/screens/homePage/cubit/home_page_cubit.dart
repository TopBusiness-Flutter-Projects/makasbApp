import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../models/user_model.dart';
import '../../../preferences/preferences.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  int index = 0;

 late UserModel userModel;
 // late ServiceApi api;

  HomePageCubit() : super(MainPageInitial()){
    getUserData();
   // api = ServiceApi();
   //updateFirebaseToken();
  }

  void updateIndex(int index){
    this.index = index;
   // emit(MainPageIndexUpdated(index));
  }
 getUserData() async{
   userModel= await Preferences.instance.getUserModel();
   emit(UserData(userModel));
   // return await Preferences.instance.getUserModel();
  }
  // updateFirebaseToken() async{
  //   getUserData().then((value)async{
  //     if(value.user.isLoggedIn){
  //       String? token = await FirebaseMessaging.instance.getToken();
  //     print('token'+token!);
  //       if(token!=null){
  //         value.firebase_token = token;
  //         Preferences.instance.setUser(value);
  //
  //         String type ='android';
  //         if(Platform.isAndroid){
  //           type = 'android';
  //         }else if(Platform.isIOS){
  //           type = 'ios';
  //         }
  //         await api.updateFireBaseToken(value.access_token, token, type);
  //
  //       }
  //     }
  //   });
  // }
}

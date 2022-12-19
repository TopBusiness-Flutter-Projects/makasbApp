import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';

import '../../../../../models/mysites.dart';
import '../../../../../models/user_model.dart';
import '../../../../../preferences/preferences.dart';
import '../../../../../remote/service.dart';


class SocialTypes  {
  late List<List<Type>> list=[];
  late List<Type> facebook=[];

  UserModel? userModel;

  SocialTypes()  {
    // getCategories();
 setData();
  }

  void setData() {
    facebook.add(Type(25, "مشاركة فيسبوك",  "Facebook Share",));
  facebook.add(Type(26, "متابعين فيسـبوك",  "Facebook Followers",));
    facebook.add(Type(27, "اعجاب بوست فيسـبوك",  "Facebook Post Like",));
    facebook.add(Type(24, "اعجابات ومتابعيين فيسـبوك",  "FB Page Likes/Followers",));

    list.add( facebook);
    
  }





}

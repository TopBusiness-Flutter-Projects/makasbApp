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
  late List<Type> instagram=[];
  late List<Type> youtube=[];
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
    instagram.add(Type(31, "متابعات انستجرام",  "Instagram Followers",));
    instagram.add(Type(1, "اعجابات انستجرام",  "Instagram Likes",));
    youtube.add(Type(9, "اشتراكات يوتيوب",  "YouTube Subscribe\r\n",));
    youtube.add(Type(10, "اعجابات يويتوب",  "YouTube Likes\r\n",));
    youtube.add(Type(11, "مشاهدات يوتيوب",  "YouTube Views\r\n",));
    list.add( facebook);
    list.add( instagram);
    list.add(youtube);

  }





}

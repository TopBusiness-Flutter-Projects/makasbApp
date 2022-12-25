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
  late List<List<TypeModel>> list=[];
  late List<TypeModel> facebook=[];
  late List<TypeModel> instagram=[];
  late List<TypeModel> youtube=[];
  late List<TypeModel> tiktok=[];
  late List<TypeModel> soundCloud=[];
  late List<TypeModel> twitter=[];
  late List<TypeModel> reddit=[];
  UserModel? userModel;

  SocialTypes()  {
    // getCategories();
 setData();
  }

  void setData() {
    facebook.add(TypeModel(25, "مشاركة فيسبوك",  "Facebook Share",));
    facebook.add(TypeModel(26, "متابعين فيسـبوك",  "Facebook Followers",));
    facebook.add(TypeModel(27, "اعجاب بوست فيسـبوك",  "Facebook Post Like",));
    facebook.add(TypeModel(24, "اعجابات ومتابعيين فيسـبوك",  "FB Page Likes/Followers",));
    instagram.add(TypeModel(31, "متابعات انستجرام",  "Instagram Followers",));
    instagram.add(TypeModel(1, "اعجابات انستجرام",  "Instagram Likes",));
    youtube.add(TypeModel(9, "اشتراكات يوتيوب",  "YouTube Subscribe\r\n",));
    youtube.add(TypeModel(10, "اعجابات يويتوب",  "YouTube Likes\r\n",));
    youtube.add(TypeModel(11, "مشاهدات يوتيوب",  "YouTube Views\r\n",));
    tiktok.add(TypeModel(2, "متابعين تيك توك",  "TikTok Followers",));
    tiktok.add(TypeModel(3, "اعجابات فيديوز تيك توك",  "TikTok Video Likes\r\n",));
    soundCloud.add(TypeModel(17, "اعجابات ساوند كلاود",  "SoundCloud Likes\r\n",));
    soundCloud.add(TypeModel(18, "متباعين ساوند كلاود",  "SoundCloud Follow\r\n",));
    soundCloud.add(TypeModel(19, "مشاهدات ساوند كلاود",  "SoundCloud Plays\r\n",));
    twitter.add(TypeModel(4, "متابعين تويتـر",  "Twitter Followers",));
    twitter.add(TypeModel(5, "تغديرات تويتر",  "Twitter Tweets\r\n",));
    twitter.add(TypeModel(6, "اعادة تويتر",  "Twitter Retweets\r\n",));
    twitter.add(TypeModel(8, "اعجابات تويتر",  "Twitter Likes\r\n",));
    reddit.add(TypeModel(29, "تحديثات رديت",  "Reddit Updates",));
    reddit.add(TypeModel(30, "اعضاء رديت",  "Reddit Members",));

    list.add( facebook);
    list.add( instagram);
    list.add(youtube);
    list.add(tiktok);
    list.add(soundCloud);
    list.add(twitter);
    list.add(reddit);
  }





}

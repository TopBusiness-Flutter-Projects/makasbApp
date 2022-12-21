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
  late List<Type> tiktok=[];
  late List<Type> soundCloud=[];
  late List<Type> twitter=[];
  late List<Type> reddit=[];
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
    tiktok.add(Type(2, "متابعين تيك توك",  "TikTok Followers",));
    tiktok.add(Type(3, "اعجابات فيديوز تيك توك",  "TikTok Video Likes\r\n",));
    soundCloud.add(Type(17, "اعجابات ساوند كلاود",  "SoundCloud Likes\r\n",));
    soundCloud.add(Type(18, "متباعين ساوند كلاود",  "SoundCloud Follow\r\n",));
    soundCloud.add(Type(19, "مشاهدات ساوند كلاود",  "SoundCloud Plays\r\n",));
    twitter.add(Type(4, "متابعين تويتـر",  "Twitter Followers",));
    twitter.add(Type(5, "تغديرات تويتر",  "Twitter Tweets\r\n",));
    twitter.add(Type(6, "اعادة تويتر",  "Twitter Retweets\r\n",));
    twitter.add(Type(8, "اعجابات تويتر",  "Twitter Likes\r\n",));
    reddit.add(Type(29, "تحديثات رديت",  "Reddit Updates",));
    reddit.add(Type(30, "اعضاء رديت",  "Reddit Members",));

    list.add( facebook);
    list.add( instagram);
    list.add(youtube);
    list.add(tiktok);
    list.add(soundCloud);
    list.add(twitter);
    list.add(reddit);
  }





}

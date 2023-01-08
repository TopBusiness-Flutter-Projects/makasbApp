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
  late List<TypeModel> pinterest=[];
  UserModel? userModel;

  SocialTypes()  {
    // getCategories();
 setData();
  }

  void setData() {
    facebook.add(TypeModel(25, "مشاركة فيسبوك",  "Facebook Share","get FREE points by liking".tr(),"To get free points by sharing".tr()));
    facebook.add(TypeModel(26, "متابعين فيسـبوك",  "Facebook Followers","For this section only".tr(),"To get free points by sharing".tr()));
    facebook.add(TypeModel(27, "اعجاب بوست فيسـبوك",  "Facebook Post Like","For this section only - click the FOLLOW button if there is no LIKE button in the pop-up windowA".tr(),"To get free points by sharing".tr()));
    facebook.add(TypeModel(24, "اعجابات ومتابعيين فيسـبوك",  "FB Page Likes/Followers","For this section only".tr(),"To get free points by sharing".tr()));
    instagram.add(TypeModel(31, "متابعات انستجرام",  "Instagram Followers","get FREE points by liking, following".tr(),"To get free points by following".tr()));
    instagram.add(TypeModel(1, "اعجابات انستجرام",  "Instagram Likes","get FREE points by liking, following".tr(),"To get free points by following".tr()));
    youtube.add(TypeModel(9, "اشتراكات يوتيوب",  "YouTube Subscribe\r\n","get FREE points by liking, following".tr(),"Get free points by subscribing others YouTube Channels".tr()));
    youtube.add(TypeModel(10, "اعجابات يويتوب",  "YouTube Likes\r\n","get FREE points by liking, following".tr(),"Get free points by subscribing others YouTube Channels".tr()));
    youtube.add(TypeModel(11, "مشاهدات يوتيوب",  "YouTube Views\r\n","get FREE points by liking, following".tr(),"Get free points by subscribing others YouTube Channels".tr()));
    tiktok.add(TypeModel(2, "متابعين تيك توك",  "TikTok Followers","get FREE points by liking, following".tr(),"To get free points by following others TikTok accounts click on the follow button".tr()));
    tiktok.add(TypeModel(3, "اعجابات فيديوز تيك توك",  "TikTok Video Likes\r\n","get FREE points by liking, following".tr(),"To get free points by following others TikTok accounts click on the follow button".tr()));
    soundCloud.add(TypeModel(17, "اعجابات ساوند كلاود",  "SoundCloud Likes\r\n","get FREE points by liking, following".tr(),"To get free points by liking others SoundCloud Tracks click on the like button".tr()));
    soundCloud.add(TypeModel(18, "متباعين ساوند كلاود",  "SoundCloud Follow\r\n","get FREE points by liking, following".tr(),"To get free points by liking others SoundCloud Tracks click on the like button".tr()));
    soundCloud.add(TypeModel(19, "مشاهدات ساوند كلاود",  "SoundCloud Plays\r\n","get FREE points by liking, following".tr(),"To get free points by liking others SoundCloud Tracks click on the like button".tr()));
    twitter.add(TypeModel(4, "متابعين تويتـر",  "Twitter Followers","get FREE points by liking, following".tr(),"Get free points for tweeting other".tr()));
    twitter.add(TypeModel(5, "تغديرات تويتر",  "Twitter Tweets\r\n","get FREE points by liking, following".tr(),"Get free points for tweeting other".tr()));
    twitter.add(TypeModel(6, "اعادة تويتر",  "Twitter Retweets\r\n","get FREE points by liking, following".tr(),"Get free points for tweeting other".tr()));
    twitter.add(TypeModel(8, "اعجابات تويتر",  "Twitter Likes\r\n","get FREE points by liking, following".tr(),"Get free points for tweeting other".tr()));
    reddit.add(TypeModel(29, "تحديثات رديت",  "Reddit Updates","get FREE points by liking, following".tr(),"o get free points by upvoting others Reddit Posts or Comments click on the upvote".tr()));
    reddit.add(TypeModel(30, "اعضاء رديت",  "Reddit Members","get FREE points by liking, following".tr(),"o get free points by upvoting others Reddit Posts or Comments click on the upvote".tr()));
    pinterest.add(TypeModel(14, "حفظ بنترست",  "Pinterest Save\r\n","get FREE points by liking, following".tr(),"oGet free points by subscribing/joining others Telegram Channels/Groups".tr()));
    pinterest.add(TypeModel(15, "متابعين بنترست",  "Pinterest Followers\r\n","get FREE points by liking, following".tr(),"oGet free points by subscribing/joining others Telegram Channels/Groups".tr()));
    list.add( facebook);
    list.add( instagram);
    list.add(youtube);
    list.add(tiktok);
    list.add(soundCloud);
    list.add(twitter);
    list.add(reddit);
    list.add(pinterest);
  }





}

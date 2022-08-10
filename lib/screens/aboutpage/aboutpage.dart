import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';
class aboutpage extends StatefulWidget {
  const aboutpage({Key? key}) : super(key: key);

  @override
  State<aboutpage> createState() => _aboutpageState();
}

class _aboutpageState extends State<aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: true,

        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: false,
          title: Text(
            'adsite'.tr(),
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          leading: AppWidget.buildBackArrow(context: context),
        ),
        backgroundColor: AppColors.white,
        body:
            Container
              (
                padding: EdgeInsets.all(7),
        child:ListView(children: [
          Container(
            padding: EdgeInsets.all(7),
          alignment: Alignment.topCenter,
          width: 220.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                '${AppConstant.localImagePath}logo.png',
                width: 170.0,
                height: 60,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 64.0,
              ),
            ],
          ),
        ),
          Row(

            children: [
           // give it width

              Text(

                'Makasb'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.colorPrimary),
              ),
              SizedBox(width: 10,),
              Text(
                'Makasb helps you to'.tr(),
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
            ],
          ),

          const SizedBox(
            height: 10.0,
          ),
          Expanded(flex: 1,child: Container(
              child:const Text(
                  "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      "increase Facebook Likes, Facebook Share, Facebook Followers, Facebook Post Likes, Facebook Post Share, CoinMarketCap Watchlists, Reddit Community Members, Reddit Post/Comments Upvotes, YouTube Subscribe, YouTube Video Likes, YouTube Views, Twitter Followers, Twitter Tweets, Twitter Likes, VK Page Followers, VK Group Join, Instagram Followers, Instagram Photo Likes, Pinterest Followers, Pinterest Post Save, Reverbnation Fans, SoundCloud Followers, SoundCloud Music Listening, Twitch Followers, TikTok Followers, TikTok Video Likes, Likee Followers/Fan, Telegram Channel Subscribers, Subscribers and Website Hits"
                      ""
                  ,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black),
              )
          ),)

        ],))
    );
  }
}

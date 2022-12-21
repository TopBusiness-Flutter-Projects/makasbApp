

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colors/colors.dart';
import '../../../../constants/app_constant.dart';
import 'cubit/socialTyps.dart';
import 'package:makasb/models/type.dart';

class socialWidget extends StatefulWidget {
  const socialWidget({Key? key}) : super(key: key);

  @override
  State<socialWidget> createState() => _socialWidgetState();
}

class _socialWidgetState extends State<socialWidget> {
  SocialTypes socialTypes=SocialTypes();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:
           ListView(
children: [
  socialMedia("facebook.png","facebook".tr(),socialTypes.list.elementAt(0)),
  socialMedia("instagram.png","instagram".tr(),socialTypes.list.elementAt(1)),
  socialMedia("youtube.png","youtube".tr(),socialTypes.list.elementAt(2)),
  socialMedia("tiktok.png","tiktok".tr(),socialTypes.list.elementAt(3)),
  socialMedia("sound_cloud.png","sound_cloud".tr(),socialTypes.list.elementAt(4)),
  socialMedia("twitter.png","twitter".tr(),socialTypes.list.elementAt(5)),
  socialMedia("reddit.png","reddit".tr(),socialTypes.list.elementAt(6))


]            ,
          )
    );
  }

  socialMedia(String imageNAME, String title,List<Type> _list) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

  return  Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.colorPrimary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: ExpansionTile(

        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              '${AppConstant.localImagePath}$imageNAME',
              width: 20.0,
              height: 20.0,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
        trailing: Transform.rotate(
            angle:
            Localizations.localeOf(context).languageCode == 'en'
                ? 0
                : 3.14,
            child: SvgPicture.asset(
              '${AppConstant.localImagePath}arrow.svg',
              width: 20.0,
              height: 20.0,
            )),
        children: [
          ListView.builder(
            itemCount: _list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: const BoxDecoration(
                    color: AppColors.grey9,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        lang=="ar"?_list.elementAt(index).titleAr:_list.elementAt(index).titleEn,
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey1),
                      ),
                    ],
                  ));
            },
          )
        ],
      ),
    );

  }

  @override
  void initState() {
    super.initState();

  }
}

import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/sites.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../models/slider.dart';
import '../../../../models/user_model.dart';
import '../../../../widgets/app_widgets.dart';
import 'cubit/main_page_cubit.dart';
import 'home_screen_widgets.dart';

class mainWidget extends StatefulWidget {
  const mainWidget({Key? key}) : super(key: key);

  @override
  State<mainWidget> createState() => _mainWidgetState();
}

class _mainWidgetState extends State<mainWidget>
    with SingleTickerProviderStateMixin {
  int index1=0;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView(children: [
        const SizedBox(height: 10),
        _userShow(),
        sliders(),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.rotate(
                angle: Localizations.localeOf(context).languageCode == 'en'
                    ? 0
                    : 3.14,
                child: Image.asset(
                  '${AppConstant.localImagePath}rectangle.png',
                  width: 20.0,
                  height: 40.0,
                )),
            Text(
              "top_social_media".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ],
        ),
        Row(
          children: [
            cardsocialitem("youtube.png"),
            cardsocialitem("instagram.png"),
            cardsocialitem("tiktok.png"),
            cardsocialitem("twitter.png"),
          ],
        ),
        Row(
          children: [
            cardsocialitem("facebook.png"),
            cardsocialitem("sound_cloud.png"),
            cardsocialitem("pinterest.png"),
            cardsocialitem("reddit.png"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Transform.rotate(
                angle: Localizations.localeOf(context).languageCode == 'en'
                    ? 0
                    : 3.14,
                child: Image.asset(
                  '${AppConstant.localImagePath}rectangle.png',
                  width: 20.0,
                  height: 40.0,
                )),
            Text(
              "My Sites".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            InkWell(
                onTap: () {

                },
                child: SvgPicture.asset(
                  '${AppConstant.localImagePath}info.svg',
                  width: 20.0,
                  height: 20.0,
                )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: const BoxDecoration(
              color: AppColors.colorPrimary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  "Site".tr(),
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                )),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      "Site Name".tr(),
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ))),
              ],
            )),
        mySites(),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(AppConstant.pageAddSiteRoute);
            },
            icon: // <-- Icon
                SvgPicture.asset(
              '${AppConstant.localImagePath}add.svg',
              width: 20.0,
              height: 20.0,
            ),

            label: Text('addsite'.tr()), // <-- Text
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ])),
    ]);
  }

 Widget _userShow() {

    MainPageCubit cubit = BlocProvider.of(context);
    return BlocProvider.value(
        value: BlocProvider.of<MainPageCubit>(context),
        child:
        BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {

              UserModel? userModel;
              if (state is IsLoadingData) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),
                  ),
                );
              }
              else if (state is OnError) {
                return Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: refreshData,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppWidget.svg(
                              'reload.svg', AppColors.colorPrimary, 24.0, 24.0),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'reload'.tr(),
                            style: TextStyle(
                                color: AppColors.colorPrimary, fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }else{
                userModel=cubit.userModel!;
                return  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.colorPrimary,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(10),
                            width: 90.0,
                            height: 90.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child:
                              userModel!=null&&userModel.data.image!=null?
                              CachedNetworkImage(
                                  width: 90.0,
                                  height: 90.0,
                                  imageUrl: userModel.data.image!,
                                  placeholder: (context, url) =>
                                      Container(
                                        color: AppColors.grey2,
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                      Container(
                                        color: AppColors.grey2,
                                      ))
                                  :Image.asset(
                                '${AppConstant.localImagePath}logo.png',
                                width: 90.0,
                                height: 90.0,
                              ),
                            )),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      '${AppConstant.localImagePath}hand.svg',
                                    ),
                                    const SizedBox(width: 5), // give it width

                                    Text(
                                      'welcome'.tr(),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.black),
                                    ),
                                  ],
                                )),
                            Text(
                              "${userModel!=null?userModel.data.userName:"username".tr()}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorPrimary),
                            )
                          ],
                        )
                      ],
                    ));}




            }));
    }


  Widget mySites() {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    return BlocProvider.value(
        value: cubit,
        child:
        BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
          if (state is IsLoadingData) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.colorPrimary,
                ),
              ),
            );
          }
          else if (state is OnError) {
            return Expanded(
              child: Center(
                child: InkWell(
                  onTap: refreshData,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppWidget.svg(
                          'reload.svg', AppColors.colorPrimary, 24.0, 24.0),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'reload'.tr(),
                        style: TextStyle(
                            color: AppColors.colorPrimary, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          else {
            List<Sites> list = cubit.projects;

            if (list.isNotEmpty) {
              return Expanded(
                  child: RefreshIndicator(
                      color: AppColors.colorPrimary,
                      onRefresh: refreshData,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              height: 60.0,
                              child: InkWell(
                                  child: Card(
                                      elevation: 1.0,
                                      color: AppColors.grey3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Expanded(
                                              child: Text(
                                            lang == "ar"
                                                ? list
                                                    .elementAt(index)
                                                    .type
                                                    .titleAr
                                                : list
                                                    .elementAt(index)
                                                    .type
                                                    .titleEn,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black),
                                          )),
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                  child: Text(
                                                list.elementAt(index).title,
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.black),
                                              ))),
                                          InkWell(
                                            onTap: () {
                                              cubit.deleteSite(index, list.elementAt(index).id );

                                            },
                                          child: SvgPicture.asset(
                                            '${AppConstant.localImagePath}remove.svg',
                                            width: 20.0,
                                            height: 20.0,
                                          )),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      ))));
                        },
                      )));
            } else {
              return Expanded(
                  child: Center(
                child: Text(
                  'no_projects'.tr(),
                  style: TextStyle(color: AppColors.black, fontSize: 15.0),
                ),
              ));
            }
          }
        }));
  }

  Widget sliders() {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    return
      BlocProvider.value(
        value: cubit,
        child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
          if (state is IsLoadingData) {
            return Container(
              height: 180,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.colorPrimary,
                ),
              ),
            );
          } else if (state is OnError) {
            return Expanded(
              child: Center(
                child: InkWell(
                  onTap: refreshData1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppWidget.svg(
                          'reload.svg', AppColors.colorPrimary, 24.0, 24.0),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'reload'.tr(),
                        style: TextStyle(
                            color: AppColors.colorPrimary, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            List<SliderModel> list = cubit.sliders;

            if (list.isNotEmpty) {
              return
                Expanded(
                  child: RefreshIndicator(
                      color: AppColors.colorPrimary,
                      onRefresh: refreshData1,
                      child:
                      AddScreenWidget(
                        sliderModel: list

                      ),

                      )
                );
            } else {
              return Expanded(
                  child: Center(
                child: Text(
                  'no_projects'.tr(),
                  style: TextStyle(color: AppColors.black, fontSize: 15.0),
                ),
              ));
            }
          }
        }));
  }

  Future<void> refreshData() async {
    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    cubit.getData();

  }
  Future<void> refreshData1() async {
    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    cubit.getData();

  }

  cardsocialitem(String name) {
    return Expanded(
        child: Card(
            elevation: 10,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
                height: 70,
                child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                                height: 50,
                                fit: BoxFit.cover,
                                '${AppConstant.localImagePath}$name')))))));
  }



}

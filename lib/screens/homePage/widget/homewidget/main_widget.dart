import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/sites.dart';
import 'package:makasb/screens/dialogpage/dialoginfopage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../widgets/app_widgets.dart';
import 'cubit/main_page_cubit.dart';

class mainWidget extends StatefulWidget {
  const mainWidget({Key? key}) : super(key: key);

  @override
  State<mainWidget> createState() => _mainWidgetState();
}

class _mainWidgetState extends State<mainWidget>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < 10) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    //
    //   _pageController.animateToPage(
    //     _currentPage.toInt(),
    //     duration: const Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(

        children: [
        const SizedBox(height: 10),

        _userShow(),
        Container(
            constraints: const BoxConstraints.expand(height: 230),
            child: _imageSlider(context)),
        Center(child: SmoothPageIndicator(
          controller: _pageController, // PageController
          count: 10,
          effect: const ExpandingDotsEffect(
              expansionFactor: 2), // your preferred effect
        )),
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
                  // todo : your code is here
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog();
                      });
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
                Text(
                  "Site".tr(),
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Text(
                  "Site Name".tr(),
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            )),
      Expanded(child:
      mySites()),
          ElevatedButton.icon(
            onPressed: () {


              Navigator.of(context)
                  .pushReplacementNamed(AppConstant.pageAddSiteRoute);



            },
            icon: Icon( // <-- Icon
              Icons.add,
              size: 24.0,
            ),
            label: Text('addpost'.tr()), // <-- Text
          ),
      ]
    );
  }

  _userShow() {
    return Container(
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
                  child: Image.asset(
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
                          '${AppConstant.localImagePath}dolar.svg',
                        ),
                        const SizedBox(width: 5), // give it width

                        Text(
                          'email'.tr(),
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black),
                        ),
                      ],
                    )),
                const Text(
                  "Mahmoud Elkomy",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorPrimary),
                )
              ],
            )
          ],
        ));
  }

  _imageSlider(context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "https://images.unsplash.com/photo-1595445364671-15205e6c380c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=764&q=80",
                  fit: BoxFit.fill,
                )));
      },
      itemCount: 10,
    );
  }

  mySites() {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    return BlocProvider.value(
        value: cubit,
        child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
          if (state is IsLoadingData) {
            return const Expanded(
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
          } else {
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
                                          Text(
                                            lang=="ar"?list.elementAt(index).type.titleAr:list.elementAt(index).type.titleEn,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(),
                                          ),
                                          Text(
                                          list.elementAt(index).title,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(),
                                          ),
                                          SvgPicture.asset(
                                            '${AppConstant.localImagePath}remove.svg',
                                            width: 20.0,
                                            height: 20.0,
                                          ),
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

  Future<void> refreshData() async {
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

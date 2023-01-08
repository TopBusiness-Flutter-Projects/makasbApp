import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../models/points.dart';
import '../../../../widgets/app_widgets.dart';
import 'cubit/coins_page_cubit.dart';

class coinsWidget extends StatefulWidget {
  const coinsWidget({Key? key}) : super(key: key);

  @override
  State<coinsWidget> createState() => _coinsWidgetState();
}

class _coinsWidgetState extends State<coinsWidget>
    with SingleTickerProviderStateMixin {
  double _currentPage = 0;

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
    return
      ListView(children: [
        // const SizedBox(height: 10),
        // Row(
        //   children: [
        //     Transform.rotate(
        //         angle: Localizations.localeOf(context).languageCode == 'en'
        //             ? 0
        //             : 3.14,
        //         child: Image.asset(
        //           '${AppConstant.localImagePath}rectangle.png',
        //           width: 20.0,
        //           height: 40.0,
        //         )),
        //     Text(
        //       "top_social_media".tr(),
        //       style: const TextStyle(
        //           fontSize: 20.0,
        //           fontWeight: FontWeight.bold,
        //           color: AppColors.black),
        //     ),
        //   ],
        // ),
        // Container(
        //     constraints: const BoxConstraints.expand(height: 260),
        //     child: _imageSlider(context)),
        // SmoothPageIndicator(
        //   controller: _pageController, // PageController
        //   count: 10,
        //   effect: const ExpandingDotsEffect(
        //       expansionFactor: 2), // your preferred effect
        // ),
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
              "buypoint".tr(),
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppConstant.pageBuypointRoute);
              },
            child: Text(
              "showall".tr(),

              style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.red),
            )),
            SizedBox(width: 3,)
          ],
        ),
        
       coins(),
        const SizedBox(height: 10),
      ]);
  }

  // _imageSlider(context) {
  //   return PageView.builder(
  //     controller: _pageController,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Container(
  //           margin: const EdgeInsets.all(10),
  //           child: Card(
  //             child: Container(
  //               child: Column(
  //                 children: [
  //                   Html(
  //                     data: """
  //               <div>Follow<a class='sup'><sup>pl</sup></a>
  //                 Below hr
  //                   <b>Bold</b>
  //               <h1>what was sent down to you from your Lord</h1>,
  //               and do not follow other guardians apart from Him. Little do
  //               <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
  //               """,
  //                     onImageError: (node, children) {
  //                       if (node is dom.Element) {
  //                         switch (node.localName) {
  //                           case "custom_tag": // using this, you can handle custom tags in your HTML
  //                           // return Column(children: children);
  //                         }
  //                       } else {}
  //                     },
  //                   ),
  //                   ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                         primary: AppColors.colorPrimary,
  //                         elevation: 5,
  //                         shadowColor: AppColors.grey8),
  //                     onPressed: () {
  //                       Navigator.of(context)
  //                           .pushReplacementNamed(AppConstant.pageHomeRoute);
  //                     },
  //                     child: Text('buy now'.tr()),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ));
  //     },
  //     itemCount: 10,
  //   );
  // }
  Widget coins() {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    CoinsPageCubit cubit = BlocProvider.of<CoinsPageCubit>(context);
    return BlocListener<CoinsPageCubit, CoinsPageState>(listener: (context, state) {


      if(state is OnOrderSuccess){
        state.model.token=cubit.userModel!.data.token;
        Navigator.pushNamed(context, AppConstant.pagePaymentRoute,arguments: state.model).then((value) =>
        {cubit.updateUserData(context)});
      }},
    child: BlocProvider.value(
        value: cubit,
        child:
        BlocBuilder<CoinsPageCubit, CoinsPageState>(
            builder: (context, state) {
              if (state is IsLoadingData) {
                return
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.colorPrimary,
                    ),

                );
              }
              else if (state is OnError) {
                return  Center(
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

                );
              }
              else {
                List<Points> list = cubit.projects;

                if (list.isNotEmpty) {
                  return RefreshIndicator(
                          color: AppColors.colorPrimary,
                          onRefresh: refreshData,
                          child:  LayoutBuilder(
                              builder: (context, constraints) => GridView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
                                  childAspectRatio: 1.4,
                                  mainAxisSpacing: 1,

                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return
                                      InkWell(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                            alignment: Alignment.center,
                                            decoration:  BoxDecoration(
                                                border: Border.all(color: AppColors.grey5),
                                                color: AppColors.white,

                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(0),
                                                    bottomLeft: Radius.circular(15),
                                                    topRight: Radius.circular(15),
                                                    bottomRight: Radius.circular(0))),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: '\$',
                                                        style: TextStyle(color: Colors.grey,fontSize: 20), /*defining default style is optional */
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: '${list.elementAt(index).price}', style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.colorPrimary,fontSize: 20)),

                                                        ],
                                                      )),
                                                  ],
                                            )
                                          ,
                                                Text(
                                                  "${list.elementAt(index).number_of_points}",
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.colorPrimary),
                                                ),
                                                Text(
                                                  "point".tr(),
                                                  style: const TextStyle(
                                                      fontSize: 15.0, color: AppColors.grey1),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                            InkWell(
                                              onTap: () {

                                                cubit.sendOrder(context,list.elementAt(index).id);
                                                //   Navigator.pushNamed(context, AppConstant.pageRequestConsultationRoute,arguments: cubit.userModel);
                                              },
                                                child: Text(
                                                  "buy".tr(),
                                                  style: const TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontSize: 17.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.red),
                                                ))
                                              ],
                                            ),
                                          ));
                                },
                              )));
                } else {
                  return  Center(
                        child: Text(
                          'no_projects'.tr(),
                          style: TextStyle(color: AppColors.black, fontSize: 15.0),
                        ),
                      );
                }
              }
            })));
  }
  Future<void> refreshData() async {
    CoinsPageCubit cubit = BlocProvider.of<CoinsPageCubit>(context);
    cubit.getData();

  }
}

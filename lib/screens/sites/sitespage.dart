import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/points.dart';
import 'cubit/sites_page_cubit.dart';

class SitesWidget extends StatefulWidget {
  final TypeModel? typeModel;

  const SitesWidget({Key? key, this.typeModel}) : super(key: key);

  @override
  State<SitesWidget> createState() => _SitesWidgetState(typeModel: typeModel);
}

class _SitesWidgetState extends State<SitesWidget> {
  TypeModel? typeModel;

  _SitesWidgetState({required this.typeModel});

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
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: Text(
          '${lang == 'ar' ? typeModel!.titleAr : typeModel!.titleEn}',
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        leading: AppWidget.buildBackArrow(context: context),
      ),
      backgroundColor: AppColors.grey10,
      body: ListView

        (
          shrinkWrap: true,
          children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: Container()),
            Image.asset(
              AppConstant.localImagePath + 'shareback.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Expanded(child: Container()),
            Align(
                alignment: Alignment.topLeft,
                heightFactor: 10,
                
                child:Padding( 
                    padding: EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        showFilterSheet();
                      },
                      child:
                   SvgPicture.asset(
                  alignment: Alignment.topLeft,
                  '${AppConstant.localImagePath}info.svg',
                  width: 20.0,
                  height: 20.0,
                ))))
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
                  "points".tr(),
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                )),
                SizedBox(
                  width: 60,
                ),
                Expanded(
                    child: Text(
                  "Name".tr(),
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                )),
                Expanded(flex: 3, child: Container())
              ],
            )),
        coins(),
      ]),
    );
  }

  Widget coins() {

    SitesPageCubit cubit = BlocProvider.of<SitesPageCubit>(context);
    cubit.typemodel = typeModel;
    //refreshData();

    return BlocListener<SitesPageCubit, SitesPageState>(
        listener: (context, state) {
          if (state is OnOrderSuccess) {
            print("dlldl");
            print(cubit.site!.share);
            //state.model.token=cubit.userModel!.data.token;
            Navigator.pushNamed(context, AppConstant.pagePostRoute,
                    arguments: cubit.site!.share)
                .then((value) => {cubit.updateUserData(context)})
                .then((value) => cubit.getData(typeModel!.id));
          }
        },
        child: BlocProvider.value(
            value: cubit,
            child: BlocBuilder<SitesPageCubit, SitesPageState>(
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
                                  height: 90.0,
                                  child: InkWell(
                                      child: Card(
                                          color: AppColors.grey7,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 2, 10, 2),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              Expanded(
                                                  child: Center(
                                                      child: Text(
                                                list
                                                    .elementAt(index)
                                                    .points_for_click
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.black),
                                              ))),
                                              SizedBox(
                                                width: 60,
                                              ),

                                              Expanded(
                                                  child: Center(
                                                      child: Text(
                                                list.elementAt(index).title,
                                                style: const TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.black),
                                              ))),
                                              // Expanded(
                                              //     flex:2,child: Container()),
                                              MaterialButton(
                                                onPressed: () {
                                                  cubit.site =
                                                      list.elementAt(index);
                                                  cubit.sendOrder(
                                                      context, cubit.site!.id);
                                                  /*showConfirmCodeDialog();*/
                                                  //Navigator.pushNamed(context, AppConstant.pageUserSignUpRoleRoute);
                                                },
                                                height: 56.0,
                                                disabledColor: AppColors.grey4,
                                                child: Text(
                                                  typeModel!.action,
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 16.0),
                                                ),
                                                color: AppColors.colorPrimary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0)),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              MaterialButton(
                                                height: 56.0,
                                                disabledColor: AppColors.grey4,
                                                child: Text(
                                                  'skip'.tr(),
                                                  style: TextStyle(
                                                      color: AppColors.black,
                                                      fontSize: 16.0),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: AppColors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0)),
                                                onPressed: () {
                                                  cubit.remove(index);
                                                },
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
            })));
  }
  void showFilterSheet() {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        elevation: 8.0,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0))),
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [   Text(
                    '${lang == 'ar' ? typeModel!.titleAr : typeModel!.titleEn}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                    Expanded(child: Container(),),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppWidget.svg(
                          'close.svg', AppColors.black, 24.0, 24.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                   typeModel!.desctitle,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  typeModel!.desc,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                Center(
                child: MaterialButton(
                  onPressed:
                       () {
                    Navigator.pop(context);
                    /*showConfirmCodeDialog();*/
                    Navigator.pushNamed(context, AppConstant.pageAddSiteRoute);
                  }
                     ,
                  height: 56.0,
                  disabledColor: AppColors.grey4,
                  child: Text(
                    'Get'.tr()+ '${lang == 'ar' ? typeModel!.titleAr : typeModel!.titleEn}',
                    style: TextStyle(color: AppColors.white, fontSize: 16.0),
                  ),
                  color: AppColors.colorPrimary ,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                )),
                SizedBox(height: 5,)
              ],
            ),
          );
        });
  }

  Future<void> refreshData() async {
    SitesPageCubit cubit = BlocProvider.of<SitesPageCubit>(context);
    cubit.getData(typeModel!.id);
  }
}

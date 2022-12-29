import 'dart:async';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/points.dart';
import 'cubit/all_coins_page_cubit.dart';

class buyBointWidget extends StatefulWidget {
  const buyBointWidget({Key? key}) : super(key: key);

  @override
  State<buyBointWidget> createState() => _buyBointWidgetState();
}

class _buyBointWidgetState extends State<buyBointWidget>
     {


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
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: false,
          title: Text(
            'buypoint'.tr(),
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          leading: AppWidget.buildBackArrow(context: context),
        ),
        backgroundColor: AppColors.grey10,
        body:
        Column(children: [
            const SizedBox(height: 10),
            coins(),
          ]),
        );
  }
  coins() {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    AllCoinsPageCubit cubit = BlocProvider.of<AllCoinsPageCubit>(context);
    return BlocListener<AllCoinsPageCubit, AllCoinsPageState>(listener: (context, state) {


      if(state is OnOrderSuccess){
        state.model.token=cubit.userModel!.data.token;
        Navigator.pushNamed(context, AppConstant.pagePaymentRoute,arguments: state.model);
      }},
    child:  BlocProvider.value(
        value: cubit,
        child:
        BlocBuilder<AllCoinsPageCubit, AllCoinsPageState>(
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
                List<Points> list = cubit.projects;

                if (list.isNotEmpty) {
                  return Expanded(
                      child: RefreshIndicator(
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
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.red),
                                              ))
                                            ],
                                          ),
                                        ));
                                },
                              ))));
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
  Future<void> refreshData() async {
    AllCoinsPageCubit cubit = BlocProvider.of<AllCoinsPageCubit>(context);
    cubit.getData();

  }
}


import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/models/country_model.dart';
import 'package:makasb/models/type.dart';
import 'package:makasb/screens/addsitePage/cubit/add_site_state.dart';
import 'package:makasb/widgets/app_widgets.dart';

import '../../models/user_model.dart';
import '../../preferences/preferences.dart';
import 'cubit/add_site_cubit.dart';

class AddSitePage extends StatefulWidget {
  const AddSitePage({Key? key}) : super(key: key);

  @override
  State<AddSitePage> createState() => _AddSitePageState();
}

class _AddSitePageState extends State<AddSitePage>
    with SingleTickerProviderStateMixin {
  bool isHidden = true;
  bool isSwitched = false;
  String _selectedLocation = "";
  File uri = File("");
  List<String> _list = ["10", "20", "30"];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: Text(
          'addsite'.tr(),
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        leading: AppWidget.buildBackArrow(context: context),
      ),
      backgroundColor: AppColors.white,
      body: _buildaddSiteSection(),
    );
  }

  _buildaddSiteSection() {
    AddSiteCubit cubit = BlocProvider.of<AddSiteCubit>(context);
    return BlocListener<AddSiteCubit, AddSiteState>(
        listener: (context, state) {
          if(state is OnAddPostSuccess){
            print("Dldldlldl");
            Navigator.pop(context);
          }
        },
    child: BlocBuilder<AddSiteCubit, AddSiteState>(builder: (context, state) {

      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                AppWidget.svg('type.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'Type'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            buildTypsField(),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                AppWidget.svg('world.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'Country'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            buildCityField(),

              SizedBox(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.selectedCountryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CountryModel model =
                        cubit.selectedCountryModel.elementAt(index);
                    String lang =
                        EasyLocalization.of(context)!.locale.languageCode;

                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 1),
                        color: AppColors.white,
                        height: 48,
                        child: Row(
                          children: [
                            Text(
                              lang == 'ar' ? model.ar_name : model.en_name,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: AppColors.black, fontSize: 15.0),
                            ),
                            InkWell(
                                onTap: () {
                                  cubit.remove(model);
                                },
                                child: AppWidget.svg(
                                    'remove.svg', AppColors.black, 24.0, 24.0)),
                          ],
                        ));
                  }),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                AppWidget.svg(
                    'title_page.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'set title for site - page'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
                height: 56.0,
                decoration: BoxDecoration(
                    color: AppColors.grey8,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    maxLines: 1,
                    autofocus: false,
                    cursorColor: AppColors.colorPrimary,
                    textInputAction: TextInputAction.next,
                    onChanged: (data) {
                      cubit.model.title = data;
                      cubit.checkData();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'site title'.tr(),
                        hintStyle: const TextStyle(
                            color: AppColors.grey1, fontSize: 14.0)),
                  ),
                )),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                AppWidget.svg('file.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'page url'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
                height: 56.0,
                decoration: BoxDecoration(
                    color: AppColors.grey8,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    maxLines: 1,
                    autofocus: false,
                    cursorColor: AppColors.colorPrimary,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (data) {
                      cubit.model.url = data;
                      cubit.checkData();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'page url'.tr(),
                        hintStyle: const TextStyle(
                            color: AppColors.grey1, fontSize: 14.0)),
                  ),
                )),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                AppWidget.svg(
                    'hand_click.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'Total clicks limit'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                // Switch(
                //   value: isSwitched,
                //
                //   onChanged: (value) {
                //     setState(() {
                //       isSwitched = value;
                //       print(isSwitched);
                //     });
                //   },
                //   activeTrackColor: AppColors.colorPrimary,
                //   activeColor:AppColors.colorPrimary,
                // )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'limit'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 56.0,
                      decoration: BoxDecoration(
                          color: AppColors.grey8,
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          maxLines: 1,
                          autofocus: false,
                          cursorColor: AppColors.colorPrimary,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (data) {
                            cubit.model.total_clicks_limit = data;
                            cubit.checkData();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '1000',
                              hintStyle: const TextStyle(
                                  color: AppColors.grey1, fontSize: 14.0)),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                AppWidget.svg(
                    'hand_click.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'Daily clicks limit'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                // Switch(
                //   value: isSwitched,
                //
                //   onChanged: (value) {
                //     setState(() {
                //       isSwitched = value;
                //       print(isSwitched);
                //     });
                //   },
                //   activeTrackColor: AppColors.colorPrimary,
                //   activeColor:AppColors.colorPrimary,
                // )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'limit'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 56.0,
                      decoration: BoxDecoration(
                          color: AppColors.grey8,
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          maxLines: 1,
                          autofocus: false,
                          cursorColor: AppColors.colorPrimary,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (data) {
                            cubit.model.daily_clicks_limit = data;
                            cubit.checkData();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '1000',
                              hintStyle: const TextStyle(
                                  color: AppColors.grey1, fontSize: 14.0)),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                AppWidget.svg(
                    'hand_dolar.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'Cost/Points Per Click (from 5 to 50)'.tr(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
                height: 56.0,
                decoration: BoxDecoration(
                    color: AppColors.grey8,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    maxLines: 1,
                    autofocus: false,
                    cursorColor: AppColors.colorPrimary,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (data) {
                      cubit.model.points_for_click = data;
                      cubit.checkData();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '5'.tr(),
                        hintStyle: const TextStyle(
                            color: AppColors.grey1, fontSize: 14.0)),
                  ),
                )),
            const SizedBox(
              height: 20.0,
            ),
            buildButtonStart(),
          ],
        ),
      );
    }));
  }

  buildButtonStart() {
    AddSiteCubit cubit = BlocProvider.of<AddSiteCubit>(context);

    return BlocBuilder<AddSiteCubit, AddSiteState>(
      builder: (context, state) {
        bool isValid = cubit.isDataValid;
        if (state is AddSiteDataValidation) {
          isValid = state.valid;
        }

        return MaterialButton(
          onPressed: isValid
              ? () async {
                  cubit.addPost(context);
                }
              : null,
          height: 56.0,
          color: AppColors.colorPrimary,
          disabledColor: AppColors.grey4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Text(
            'add'.tr(),
            style: TextStyle(fontSize: 16.0, color: AppColors.white),
          ),
        );
      },
    );
  }

  void navigateToCitiesPage() async {
    var result =
        await Navigator.pushNamed(context, AppConstant.pageCountriesRoute);
    if (result != null) {
      CountryModel model = result as CountryModel;
      AddSiteCubit cubit = BlocProvider.of<AddSiteCubit>(context);
      cubit.updateSelectedCity(model);
    }
  }

  buildCityField() {
    double width = MediaQuery.of(context).size.width;
    AddSiteCubit cubit = BlocProvider.of<AddSiteCubit>(context);
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return InkWell(
      onTap: () => navigateToCitiesPage(),
      child: BlocBuilder<AddSiteCubit, AddSiteState>(
        builder: (context, state) {
          return Container(
            width: width,
            height: 54.0,
            alignment:
                lang == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            child: Text('select country'.tr()),
          );
        },
      ),
    );
  }

  buildTypsField() {
    double width = MediaQuery.of(context).size.width;
    AddSiteCubit cubit = BlocProvider.of<AddSiteCubit>(context);
    String lang = EasyLocalization.of(context)!.locale.languageCode;
    return InkWell(
      onTap: () => navigateToTypesPage(),
      child: BlocBuilder<AddSiteCubit, AddSiteState>(
        builder: (context, state) {
          return Container(
            width: width,
            height: 54.0,
            alignment:
                lang == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            child: Text(
                '${lang == 'ar' ? cubit.selectedtypeModel.titleAr : cubit.selectedtypeModel.titleEn}'),
          );
        },
      ),
    );
  }

  void navigateToTypesPage() async {
    var result = await Navigator.pushNamed(context, AppConstant.pageTypeRoute);
    if (result != null) {
      TypeModel model = result as TypeModel;
      AddSiteCubit cubit = BlocProvider.of<AddSiteCubit>(context);
      cubit.updateSelectedType(model);
    }
  }
}

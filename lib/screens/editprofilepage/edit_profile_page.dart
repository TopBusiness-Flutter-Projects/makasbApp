import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/widgets/app_widgets.dart';

import '../../models/user_model.dart';
import '../../preferences/preferences.dart';
import 'cubit/user_edit_cubit.dart';
import 'cubit/user_edit_state.dart';


class Editprofilepage extends StatefulWidget {
  const Editprofilepage({Key? key}) : super(key: key);

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage>
 with SingleTickerProviderStateMixin {
  bool isHidden = true;
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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Edit Profile'.tr(),
          style: const TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        leading: AppWidget.buildBackArrow(context: context),
      ),
      backgroundColor: AppColors.white,
      body:
         ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 173,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                 buildAvatarSection('avatar2.png'),

                  ],
                )),
            _buildLoginSection(),
          ],
        ),

    );
  }

  _buildLoginSection() {
    EditprofileCubit cubit = BlocProvider.of<EditprofileCubit>(context);
    return BlocListener<EditprofileCubit, EditprofileState>(
        listener: (context, state) {
          if (state is OnError) {
            AlertController.show('warning'.tr(), state.error, TypeAlert.warning);

          } else if (state is OnSignUpSuccess) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppConstant.pageHomeRoute,ModalRoute.withName(AppConstant.pageSplashRoute));
            //Navigator.pop(context, true);
          }
        },
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              AppWidget.svg('ic_user.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'User Name'.tr(),
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
                    controller: cubit.controllerFirstName,
                  onChanged: (data) {
                    cubit.model.user_name = data;
                    cubit.checkData();
                  },
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Full Name'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              AppWidget.svg('email.svg', AppColors.colorPrimary, 15.0, 15.0),
              const SizedBox(width: 5), // give it width

              Text(
                'email'.tr(),
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
                  controller: cubit.controllerEmail,
                  cursorColor: AppColors.colorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (data) {
                    cubit.model.email = data;
                    cubit.checkData();
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'email'.tr(),
                      hintStyle: const TextStyle(
                          color: AppColors.grey1, fontSize: 14.0)),
                ),
              )),


          buildButtonStart(),
          const SizedBox(height: 50)
        ],
      ),
    ));
  }
  buildButtonStart() {
    EditprofileCubit cubit = BlocProvider.of<EditprofileCubit>(context);
    return BlocBuilder<EditprofileCubit, EditprofileState>(
      builder: (context, state) {
        bool isValid = cubit.isDataValid;
        if (state is UserDataValidation) {
          isValid = state.valid;
        }
        return  MaterialButton (
              onPressed: isValid
                  ? () async {
                UserModel model = await Preferences.instance.getUserModel();
                if(model.data.isLoggedIn){
                  cubit.updateProfile(context,model.data.token,model.data.id!);
                }else{
                //  cubit.signUp(context);
                }

              }
                  : null,
              height: 56.0,
              color: AppColors.colorPrimary,
              disabledColor: AppColors.grey4,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                'edit'.tr(),
                style: TextStyle(fontSize: 16.0, color: AppColors.white),
              ),
            );
      },
    );
  }

  buildAvatarSection(String image) {
    EditprofileCubit cubit = BlocProvider.of(context);
    return BlocProvider.value(
      value: BlocProvider.of<EditprofileCubit>(context),
      child: BlocBuilder<EditprofileCubit, EditprofileState>(
        builder: (context, state) {
          String imagePath = cubit.model.imagePath;
          if (state is UserPhotoPicked) {
            imagePath = state.imagePath;
          }else if(state is OnUserDataGet){
            imagePath = cubit.imagePath;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  buildAlertDialog();
                },
                child: Container(
                  width: 147.0,
                  height: 147.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(147.0),
                    child: BlocProvider.of<EditprofileCubit>(context)
                        .imageType
                        .isEmpty
                        ?
                    imagePath.startsWith('http')
                        ? CachedNetworkImage(
                      imageUrl: imagePath,
                      imageBuilder: (context,imageProvider){
                        return CircleAvatar(
                          backgroundImage: imageProvider,
                        );
                      },
                      width: 147.0,
                      height: 147.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return CircleAvatar(
                          child: Image.asset(
                            AppConstant.localImagePath +
                                'avatar.png',
                            width: 147.0,
                            height: 147.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      },errorWidget: (context,url,error){
                      return CircleAvatar(
                        child: Image.asset(
                          AppConstant.localImagePath +
                              'avatar.png',
                          width: 147.0,
                          height: 147.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    )
                        : Image.asset(
                      AppConstant.localImagePath + image,
                      width: 147.0,
                      height: 147.0,
                    )
                        : Image.file(
                      File(imagePath),
                      width: 147.0,
                      height: 147.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  buildAlertDialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: BlocProvider.of<EditprofileCubit>(context),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'choose_photo'.tr(),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 1,
                    color: AppColors.grey3,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      BlocProvider.of<EditprofileCubit>(context)
                          .pickImage(type: 'camera');
                    },
                    child: Text(
                      'camera'.tr(),
                      style: TextStyle(fontSize: 18.0, color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      BlocProvider.of<EditprofileCubit>(context)
                          .pickImage(type: 'gallery');
                    },
                    child: Text(
                      'gallery'.tr(),
                      style: TextStyle(fontSize: 18.0, color: AppColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    height: 1,
                    color: AppColors.grey3,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'cancel'.tr(),
                      style: TextStyle(
                          fontSize: 18.0, color: AppColors.colorPrimary),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

}

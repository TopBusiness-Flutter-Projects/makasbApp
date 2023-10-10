import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors/colors.dart';
import '../../constants/app_constant.dart';
import '../../models/new_password_model.dart';
import '../../widgets/app_widgets.dart';
import 'cubit/new_password_cubit.dart';
import 'cubit/new_password_state.dart';

class NewPassword extends StatefulWidget {
  final NewPasswordModel newPasswordModel;

  NewPassword({Key? key, required this.newPasswordModel}) : super(key: key);

  @override
  State<NewPassword> createState() =>
      _NewPasswordState(newPasswordModel: newPasswordModel);
}

class _NewPasswordState extends State<NewPassword> {
  bool isHidden = false;
  NewPasswordModel newPasswordModel;

  _NewPasswordState({required this.newPasswordModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'newpassword'.tr(),
            style: TextStyle(color: AppColors.black),
          ),
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
        ),
        body: body(context, newPasswordModel));
  }
}

Widget body(BuildContext context, NewPasswordModel newPasswordModel) {
  NewPasswordCubit cubit = BlocProvider.of<NewPasswordCubit>(context);
  cubit.model = newPasswordModel;
  return BlocListener<NewPasswordCubit, NewPasswordState>(
      listener: (context, state) {
    print("Status=>${state}");
    if (state is OnNewPasswordSuccess) {
      Navigator.pop(context);
    }
  }, child: LayoutBuilder(builder: (context, constraints) {
    return BlocBuilder<NewPasswordCubit, NewPasswordState>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(
                    child: Image.asset(
                  '${AppConstant.localImagePath}passowrd_check.png',
                  width: 210,
                  height: 150,
                )),
              ],
            ),
            const SizedBox(height: 22),
            Text('new_password_title'.tr()),
            const SizedBox(height: 32),
            Row(
              children: [
                AppWidget.svg('lock.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'password'.tr(),
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
                    obscureText: cubit.ishidden,
                    onChanged: (data) {
                      cubit.model.password = data;
                      cubit.checkData();
                    },
                    cursorColor: AppColors.colorPrimary,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'password'.tr(),
                        hintStyle: const TextStyle(
                            color: AppColors.grey1, fontSize: 14.0),
                        suffixIcon: InkWell(
                          onTap: () {
                            cubit.hide();
                          },
                          child: cubit.ishidden
                              ? const Icon(
                                  Icons.visibility,
                                )
                              : const Icon(Icons.visibility_off),
                        )),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                AppWidget.svg('lock.svg', AppColors.colorPrimary, 15.0, 15.0),
                const SizedBox(width: 5), // give it width

                Text(
                  'password'.tr(),
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
                    obscureText: cubit.ishidden,
                    cursorColor: AppColors.colorPrimary,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (data) {
                      cubit.model.confirm_password = data;
                      cubit.checkData();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'confirmpassword'.tr(),
                        hintStyle: const TextStyle(
                            color: AppColors.grey1, fontSize: 14.0),
                        suffixIcon: InkWell(
                          onTap: () {
                            cubit.hide();
                          },
                          child: cubit.ishidden
                              ? const Icon(
                                  Icons.visibility,
                                )
                              : const Icon(Icons.visibility_off),
                        )),
                  ),
                )),
            const SizedBox(height: 48),
            BlocBuilder<NewPasswordCubit, NewPasswordState>(
                builder: (context, state) {
              bool isValid = cubit.isDataValid;
              if (state is OnNewPasswordSuccess) {
                isValid = false;
              } else if (state is UserDataValidation) {
                isValid = state.valid;
              } else if (state is OnError) {}
              return MaterialButton(
                onPressed: () {
                  cubit.newPassword(context);
                },
                padding: EdgeInsets.all(10),
                height: 56.0,
                color: isValid ? AppColors.colorPrimary : AppColors.grey4,
                disabledColor: AppColors.grey4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'done'.tr(),
                  style:
                      const TextStyle(fontSize: 16.0, color: AppColors.white),
                ),
              );
            }),
          ],
        ),
      );
    });
  }));
}

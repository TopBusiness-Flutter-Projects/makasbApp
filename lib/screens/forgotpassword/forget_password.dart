import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makasb/constants/app_constant.dart';

import '../../colors/colors.dart';
import '../../widgets/app_widgets.dart';
import 'cubit/forgot_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey8,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'forgotpassword'.tr(),
            style: TextStyle(color: AppColors.black),
          ),
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
        ),
        body: body(context));
  }
}

Widget body(BuildContext context) {
  ForgotPasswordCubit cubit = BlocProvider.of<ForgotPasswordCubit>(context);
  return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
    print("Status=>${state}");
    if (state is OnForgotPasswordSuccess) {
      Navigator.pushReplacementNamed(
          context, AppConstant.checkcodePasswordRoute,arguments: cubit.email);
    }
  }, child: LayoutBuilder(builder: (context, constraints) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  'forget_password_title'.tr(),
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  'forget_password_desc'.tr(),
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    AppWidget.svg(
                        'email.svg', AppColors.colorPrimary, 15.0, 15.0),
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
                        color: AppColors.grey10,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        maxLines: 1,
                        autofocus: false,
                        cursorColor: AppColors.colorPrimary,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (data) {
                          cubit.email = data;
                          // cubit.model.email = data;
                           cubit.checkValidForgotPasswordData();
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'email'.tr(),
                            hintStyle: const TextStyle(
                                color: AppColors.grey1, fontSize: 14.0)),
                      ),
                    )),
                const SizedBox(height: 60),
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                  bool isValid = cubit.isForgotPasswordValid;
                  if (state is OnForgotPasswordVaildFaild) {
                    isValid = false;
                  } else if (state is OnForgotPasswordVaild) {
                    isValid = true;
                  } else if (state is OnError) {}
                  return
                    MaterialButton(
                    onPressed: () {
                      cubit.forgotPassword(context);
                    },
                    padding: EdgeInsets.all(10),
                    height: 56.0,
                    color: isValid ? AppColors.colorPrimary : AppColors.grey4,
                    disabledColor: AppColors.grey4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      'send'.tr(),
                      style: TextStyle(fontSize: 16.0, color: AppColors.white),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            '${AppConstant.localImagePath}forgot_password.png',
            height: 180,
            width: MediaQuery.of(context).size.width / 2 + 80,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }));
}

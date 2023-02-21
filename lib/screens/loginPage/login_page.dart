import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:makasb/colors/colors.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/widgets/app_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white, body: buildBodySection());
  }

  Widget buildBodySection() {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);

    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
      print("Status=>${state}");
      if (state is OnSignUp) {
        Fluttertoast.showToast(
            msg: 'Invaild User'.tr(), // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM, // location
            timeInSecForIosWeb: 1 // duration
        );
      } else if (state is OnLoginSuccess) {
        Navigator.of(context).pushReplacementNamed(AppConstant.pageHomeRoute);
      }
    },
        child: LayoutBuilder(builder: (context, constraints) {
          return ListView(children: [
            const SizedBox(
              height: 56.0,
            ),
            _buildLogoSection(),
            _buildLoginSection(cubit)
          ]);
        }));
  }

  Widget _buildLogoSection() {
    return

      Container(
        alignment: Alignment.topCenter,
        width: 220.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              '${AppConstant.localImagePath}logo.png',
              width: 170.0,
              height: 60,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 64.0,
            ),
          ],
        ),
      );
  }

  Widget _buildLoginSection(LoginCubit cubit) {
    return BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'welcome_back'.tr(),
                      style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    AppWidget.svg(
                        'email.svg', AppColors.colorPrimary, 15.0, 15.0),
                    SizedBox(width: 5), // give it width

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
                        cursorColor: AppColors.colorPrimary,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (data) {
                          cubit.loginModel.email = data;
                          cubit.checkValidLoginData();
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'email'.tr(),
                            hintStyle: const TextStyle(
                                color: AppColors.grey1, fontSize: 14.0)),
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    AppWidget.svg(
                        'lock.svg', AppColors.colorPrimary, 15.0, 15.0),
                    SizedBox(width: 5), // give it width

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
                      child:
                      TextFormField(
                        maxLines: 1,
                        autofocus: false,
                        obscureText: cubit.ishidden,
                        cursorColor: AppColors.colorPrimary,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (data) {
                          cubit.loginModel.password = data;
                          cubit.checkValidLoginData();
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'password'.tr(),

                            hintStyle: const TextStyle(
                                color: AppColors.grey1, fontSize: 14.0),
                            suffixIcon: GestureDetector(
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
                Row(
                  children: [
                    // give it width
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppConstant.resetPasswordRoute);
                        },
                        child: Text(
                          'forgotpassword'.tr(),
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: AppColors.colorPrimary),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      bool isValid = cubit.isLoginValid;
                      if (state is OnLoginVaildFaild) {
                        isValid = false;
                      } else if (state is OnLoginVaild) {
                        isValid = true;
                      } else if (state is OnError) {}
                      return
                        MaterialButton(
                          onPressed: isValid
                              ? () {
                            cubit.login(context);
                            /*showConfirmCodeDialog();*/
                            //Navigator.pushNamed(context, AppConstant.pageUserSignUpRoleRoute);
                          }
                              : null,
                          height: 56.0,
                          disabledColor: AppColors.grey4,
                          child: Text(
                            'login'.tr(),
                            style: TextStyle(color: AppColors.white,
                                fontSize: 16.0),
                          ),
                          color: isValid ? AppColors.colorPrimary : AppColors
                              .grey4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        );
                    },
                  ),
                ),
                SizedBox(height: 100),
                RichText(
                    text: TextSpan(
                      style: TextStyle(color: AppColors.black),
                      /*defining default style is optional */

                      children: <TextSpan>[
                        TextSpan(
                            text: 'dont_have_account?'.tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(
                            text: 'login'.tr(),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(AppConstant.pageSignupRoute);
                              },
                            style: TextStyle(
                                color: AppColors.colorPrimary,
                                decoration: TextDecoration.underline,
                                fontSize: 16)),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}




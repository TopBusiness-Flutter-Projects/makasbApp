import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../colors/colors.dart';
import '../../constants/app_constant.dart';
import '../../models/new_password_model.dart';
import 'cubit/forgot_password_check_code_cubit.dart';

// ignore: must_be_immutable
class CheckCodePassword extends StatefulWidget {
  final String email;

  const CheckCodePassword({Key? key, required this.email}) : super(key: key);

  @override
  State<CheckCodePassword> createState() =>
      _CheckCodePasswordState(email: email);
}

class _CheckCodePasswordState extends State<CheckCodePassword> {
  String email;

  _CheckCodePasswordState({required this.email});

  @override
  void initState() {
    super.initState();
    // if(context.read<RegisterCubit>().phone.isNotEmpty){
    // }
  }

  @override
  void dispose() {
    // textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
        'reset password'.tr(),
    style: TextStyle(color: AppColors.black),
    ),
    iconTheme: IconThemeData(
    color: AppColors.black,
    ),
    ),
    body: body(context,email));
  }
}
Widget body(BuildContext context,String email) {
  ForgotPasswordCheckCodeCubit cubit = BlocProvider.of<ForgotPasswordCheckCodeCubit>(context);
  cubit.email=email;
  return BlocListener<ForgotPasswordCheckCodeCubit, ForgotPasswordCheckCodeState>(
      listener: (context, state) {
        print("Status=>${state}");
        if (state is OnForgotPasswordSuccess) {
          NewPasswordModel newPasswordModel=NewPasswordModel();
          newPasswordModel.email=email;
          newPasswordModel.code=cubit.code;
          Navigator.pushReplacementNamed(
              context, AppConstant.newPasswordRoute,arguments: newPasswordModel);
        }
      }, child: LayoutBuilder(builder: (context, constraints) {
  return Column(children: [
    Expanded(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'reset_password_title'.tr(),
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'reset_password_desc'.tr(),
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
            const SizedBox(height: 30),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  hintCharacter: '0',
                  pastedTextStyle: TextStyle(
                      color: AppColors.colorPrimary,
                      fontWeight: FontWeight.bold),
                  appContext: context,
                  length: 6,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 5) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    inactiveColor: AppColors.gray,
                    activeColor: AppColors.gray,
                    shape: PinCodeFieldShape.underline,
                    selectedColor: AppColors.colorPrimary,
                  ),
                  cursorColor: AppColors.colorPrimary,
                  animationDuration: const Duration(milliseconds: 300),
                  // errorAnimationController: errorController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                    cubit.code=value;
                    cubit.checkValidForgotPasswordData();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
  BlocBuilder<ForgotPasswordCheckCodeCubit, ForgotPasswordCheckCodeState>(
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
                'done'.tr(),
                style: const TextStyle(fontSize: 16.0, color: AppColors.white),
              ),
            );}),
            SizedBox(height: 22),

          ]),
        )),
    Align(
      alignment: Alignment.bottomLeft,
      child: Image.asset(
        '${AppConstant.localImagePath}check_code_password.png',
        height: 180,
        width: 210,
        fit: BoxFit.fill,
      ),
    )
  ]);}));
}


  

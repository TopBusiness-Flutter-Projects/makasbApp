import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/models/country_model.dart';
import 'package:makasb/screens/signupPage/cubit/user_sign_up_state.dart';

import '../../../models/user_model.dart';
import '../../../models/user_sign_up_model.dart';
import '../../../preferences/preferences.dart';
import '../../../remote/service.dart';
import '../../../widgets/app_widgets.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {

  XFile? imageFile;
  DateTime initialDate = DateTime(DateTime.now().year - 10);
  DateTime startData = DateTime(DateTime.now().year - 100);
  DateTime endData = DateTime(DateTime.now().year - 10);
  String birthDate = 'YYYY-MM-DD';
  String imageType = '';
  UserSignUpModel model = UserSignUpModel();
  bool isDataValid = false;
  bool isHidden = true;
  late ServiceApi api;
  late String imagePath;
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

 late CountryModel countryModel;

  UserSignUpCubit() : super(UserSignUpInitial()) {
    api = ServiceApi();
    countryModel=CountryModel.initValues();
    model.id = countryModel.id;

    imagePath = "";

    updateUserDataUi();
  }

  pickImage({required String type}) async {
    imageFile = await ImagePicker().pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
    imageType = 'file';
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        cropStyle: CropStyle.rectangle,
        compressFormat: ImageCompressFormat.png,
        compressQuality: 90);
    model.imagePath = croppedFile!.path;
     model.imagePath = imageFile!.path;
    imagePath = model.imagePath;
    emit(UserPhotoPicked(model.imagePath));
  }

  checkData() {
    if (model.isDataValid()) {
      isDataValid = true;
    } else {
      isDataValid = false;
    }
print("ddlldl");
print(isDataValid);
    emit(UserDataValidation(isDataValid));
  }

  signUp(BuildContext context, String code) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    try {
      UserModel response = await api.signUp(model,code);
      response.data.isLoggedIn = true;
      if (response.status.status == 200) {
        Preferences.instance.setUser(response).then((value) {
          Navigator.pop(context);
          emit(OnSignUpSuccess());
        });
      } else {
        Navigator.pop(context);
        emit(OnError(response.status.msg));
      }
    } catch (e) {
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }
  updateSelectedCity(CountryModel countryModel) {

print("ssss");
print(countryModel.id);

this.countryModel=countryModel;
model.id=this.countryModel.id;
print("D;d;d;dl");
print(model.id);

      // model.cityId = selectedCountryModel.id;
      checkData();
      emit(OnCountrySelected(countryModel));

  }
  // updateProfile(BuildContext context, String user_token) async {
  //   AppWidget.createProgressDialog(context, 'wait'.tr());
  //   try {
  //     UserModel response = await api.updateProfile(model, user_token);
  //     response.data.isLoggedIn = true;
  //     print("Dkdkdkdk" + response.status.status.toString());
  //     if (response.status.status == 200) {
  //       response.data.token = user_token;
  //       Preferences.instance.setUser(response).then((value) {
  //         Navigator.pop(context);
  //         emit(OnSignUpSuccess());
  //       });
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);
  //     OnError(e.toString());
  //   }
  // }
  hide() {
    isHidden=!isHidden;
    print("seess${isHidden}");
    emit(PasswordHidden(isHidden));
  }

  void updateUserDataUi() {
    Preferences.instance.getUserModel().then((value) {
      // if (value.user.isLoggedIn) {
      //   model.firstName = value.user.firstName;
      //   model.lastName = value.user.lastName;
      //   model.email = value.user.email;
      //   model.cityId = value.user.city.id;
      //   model.imagePath = value.user.image;
      //   updateSelectedCity(value.user.city);
      //   updateBirthDate(date: value.user.birthdate);
      //   controllerFirstName.text = model.firstName;
      //   controllerLastName.text = model.lastName;
      //   controllerEmail.text = model.email;
      //
      //   emit(OnUserDataGet());
      //   emit(UserPhotoPicked(model.imagePath));
      // }
    });
  }
}

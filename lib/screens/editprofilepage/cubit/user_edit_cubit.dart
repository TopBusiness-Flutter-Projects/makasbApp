import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/screens/editprofilepage/cubit/user_edit_state.dart';

import '../../../models/country_model.dart';
import '../../../models/edit_profile_model.dart';
import '../../../models/user_model.dart';
import '../../../models/user_sign_up_model.dart';
import '../../../preferences/preferences.dart';
import '../../../remote/service.dart';
import '../../../widgets/app_widgets.dart';

class EditprofileCubit extends Cubit<EditprofileState> {
  XFile? imageFile;

  String imageType = '';
  EditProfileModel model = EditProfileModel();
  bool isDataValid = false;
  late ServiceApi api;
  late String imagePath;
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerbalance = TextEditingController();

  late CountryModel countryModel;

  EditprofileCubit() : super(EditprofileUpInitial()) {
    api = ServiceApi();
    imagePath = "";
    countryModel = CountryModel.initValues();
    model.id = countryModel.id;
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
    // model.imagePath = imageFile!.path;
    imagePath = model.imagePath;
    emit(UserPhotoPicked(model.imagePath));
  }

  checkData() {
    if (model.isDataValid()) {
      isDataValid = true;
    } else {
      isDataValid = false;
    }

    emit(UserDataValidation(isDataValid));
  }

  updateSelectedCity(CountryModel countryModel) {
    print("ssss");
    print(countryModel.id);

    this.countryModel = countryModel;
    model.id = this.countryModel.id;
    print("D;d;d;dl");
    print(model.id);

    // model.cityId = selectedCountryModel.id;
    checkData();
    emit(OnCountrySelected(countryModel));
  }

  updateProfile(BuildContext context, String user_token, int user_id) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    try {
      UserModel response = await api.updateProfile(model, user_token, user_id);
      response.data.isLoggedIn = true;
      print("Dkdkdkdk" + response.status.status.toString());
      if (response.status.status == 200) {
        response.data.token = user_token;
        Preferences.instance.setUser(response).then((value) {
          Navigator.pop(context);
          emit(OnSignUpSuccess());
        });
      }
      else{
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg:response.status.msg, // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM, // location
            timeInSecForIosWeb: 1 // duration
        );
      }

    } catch (e) {
      print("dldldldl${e}");
      Navigator.pop(context);
      OnError(e.toString());
    }
  }
  transfertomoney(BuildContext context, String user_token) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    try {
      var response = await api.transfartomony( user_token);

    //  print("Dkdkdkdk" + response.status.status.toString());
      if (response.status == 200) {
        Navigator.pop(context);

      }
      else{
        Navigator.pop(context);
      }
      Fluttertoast.showToast(
          msg:response.msg, // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.BOTTOM, // location
          timeInSecForIosWeb: 1 // duration
      );
    } catch (e) {
      print("dldldldl${e}");
      Navigator.pop(context);
      OnError(e.toString());
    }
  }

  void updateUserDataUi() {
    Preferences.instance.getUserModel().then((value) {
      if (value.data.isLoggedIn) {
        model.user_name = value.data.userName!;
        model.email = value.data.email!;
        model.phone = value.data.phone!;
        model.imagePath = value.data.image!;
        controllerFirstName.text = model.user_name;
        controllerEmail.text = model.email;
        controllerPhone.text = model.phone;
        controllerbalance.text = value.data.balance.toString();
        model.id = value.data.country_data.id;
        this.countryModel=value.data.country_data;
        emit(OnCountrySelected(countryModel));
        emit(OnUserDataGet());
        emit(UserPhotoPicked(model.imagePath));
        checkData();
      }
    });
  }
}

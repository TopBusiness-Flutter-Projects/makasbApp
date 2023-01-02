import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/screens/editprofilepage/cubit/user_edit_state.dart';

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

  EditprofileCubit() : super(EditprofileUpInitial()) {
    api = ServiceApi();
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


  updateProfile(BuildContext context, String user_token, int user_id) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    try {
      UserModel response = await api.updateProfile(model, user_token,user_id);
      response.data.isLoggedIn = true;
      print("Dkdkdkdk" + response.status.status.toString());
      if (response.status.status == 200) {
        response.data.token = user_token;
        Preferences.instance.setUser(response).then((value) {
          Navigator.pop(context);
          emit(OnSignUpSuccess());
        });
      }
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
        model.imagePath = value.data.image!;
        controllerFirstName.text = model.user_name;
        controllerEmail.text = model.email;

        emit(OnUserDataGet());
        emit(UserPhotoPicked(model.imagePath));
        checkData();
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/models/country_model.dart';
import 'package:makasb/models/type.dart';
import 'package:meta/meta.dart';

import '../../../../preferences/preferences.dart';
import '../../../../widgets/app_widgets.dart';
import '../../../remote/service.dart';
import 'add_site_state.dart';


class AddSiteCubit extends Cubit<AddSiteState> {
  XFile? imageFile;
  late ServiceApi api;

  late CountryModel selectedCountryModel;
  late TypeModel selectedtypeModel;


  bool isDataValid = false;

  AddSiteCubit() : super(AddSiteInitial()){
    selectedCountryModel = CountryModel.initValues();
    selectedtypeModel = TypeModel.initValues();

    api = ServiceApi();
  }


  checkData() {
    // if (model.isDataValid()) {
    //   isDataValid = true;
    // } else {
    //   isDataValid = false;
    // }
    // print('Valid=>${isDataValid}');
    // emit(AddSiteDataValidation(isDataValid));
  }
  updateSelectedCity(CountryModel countryModel) {
    selectedCountryModel = countryModel;
    // model.cityId = selectedCountryModel.id;
    checkData();
    emit(OnCitySelected(countryModel));
    //updateUserDataUi();
  }
  updateSelectedType(TypeModel typeModel) {
    selectedtypeModel = typeModel;
    // model.cityId = selectedCountryModel.id;
    checkData();
    emit(OnTypeSelected(typeModel));
    //updateUserDataUi();
  }

}

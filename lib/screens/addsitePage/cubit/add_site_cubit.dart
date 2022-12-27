import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makasb/models/country_model.dart';
import 'package:makasb/models/status_resspons.dart';
import 'package:makasb/models/type.dart';
import 'package:meta/meta.dart';

import '../../../../preferences/preferences.dart';
import '../../../../widgets/app_widgets.dart';
import '../../../models/add_site_model.dart';
import '../../../remote/service.dart';
import 'add_site_state.dart';

class AddSiteCubit extends Cubit<AddSiteState> {
  late ServiceApi api;

  late List<CountryModel> selectedCountryModel = [];
  late TypeModel selectedtypeModel;
  AddSideModel model = AddSideModel();

  bool isDataValid = false;

  AddSiteCubit() : super(AddSiteInitial()) {
    selectedtypeModel = TypeModel.initValues();

    api = ServiceApi();
    updateUserDataUi();
  }

  void updateUserDataUi() {
    Preferences.instance.getUserModel().then((value) {
      if (value.data.isLoggedIn) {
        model.user_id = value.data.id!;
      }
    });
  }

  checkData() {
    if (model.isDataValid()) {
      isDataValid = true;
    } else {
      isDataValid = false;
    }
    print('Valid=>${isDataValid}');
    emit(AddSiteDataValidation(isDataValid));
  }

  updateSelectedCity(CountryModel countryModel) {
    bool s = false;
    if (selectedCountryModel.isNotEmpty) {
      s = selectedCountryModel.map((item) => item.id).contains(countryModel.id);
    }
    print("ssss${s}");
    if (!s) {
      selectedCountryModel.add(countryModel);
      model.country.add(countryModel.id);
      // model.cityId = selectedCountryModel.id;
      checkData();
      emit(OnCountrySelected(selectedCountryModel));
      //updateUserDataUi();
    }
  }

  updateSelectedType(TypeModel typeModel) {
    selectedtypeModel = typeModel;
    model.site_type = typeModel.id;
    // model.cityId = selectedCountryModel.id;
    checkData();
    emit(OnTypeSelected(typeModel));
    //updateUserDataUi();
  }

  void remove(CountryModel model) {
    selectedCountryModel.remove(model);

    // model.cityId = selectedCountryModel.id;
    checkData();
    emit(OnCountrySelected(selectedCountryModel));
  }

  addPost(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    try {
      StatusResponse response = await api.addSite(model);
      if (response.status == 200) {

          Navigator.pop(context);
          emit(OnAddPostSuccess());

      }
      else{
        Navigator.pop(context);
        emit(OnError(response.msg));
      }
    } catch (e) {
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }

}

import 'package:bloc/bloc.dart';
import 'package:makasb/preferences/preferences.dart';
import 'package:makasb/screens/type_screen/cubit/type_state.dart';

import 'package:meta/meta.dart';

import '../../../models/type.dart';
import '../../../models/type_data_model.dart';
import '../../../models/user_model.dart';
import '../../../remote/service.dart';


class TypeCubit extends Cubit<TypeState> {
  late ServiceApi api;
  late List<TypeModel> list;

  late UserModel userModel;

  TypeCubit() : super(IsLoading()) {
    api = ServiceApi();
    list = [];
    getUserData().then((value) => getType());

  }


// getCategories();

Future<UserModel?> getUserData() async {
  userModel = await Preferences.instance.getUserModel();
  return userModel;
}

  void getType() async {
    try{
      emit(IsLoading());
      TypeDataModel response = await api.getType(userModel);
      if(response.status.status==200){
        list = response.data;
        emit(OnDataSuccess(list));
      }
    }catch (e){
      OnError(e.toString());
    }
  }


}

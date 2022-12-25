import 'package:bloc/bloc.dart';
import 'package:makasb/screens/type_screen/cubit/type_state.dart';

import 'package:meta/meta.dart';

import '../../../models/type.dart';
import '../../../models/type_data_model.dart';
import '../../../remote/service.dart';


class TypeCubit extends Cubit<TypeState> {
  late ServiceApi api;
  late List<TypeModel> list;

  TypeCubit() : super(IsLoading()) {
    api = ServiceApi();
    list = [];

    getType();
  }

  void getType() async {
    try{
      emit(IsLoading());
      TypeDataModel response = await api.getType();
      if(response.status.status==200){
        list = response.data;
        emit(OnDataSuccess(list));
      }
    }catch (e){
      OnError(e.toString());
    }
  }


}

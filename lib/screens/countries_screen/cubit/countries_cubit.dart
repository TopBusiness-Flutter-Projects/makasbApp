import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../models/country_data_model.dart';
import '../../../models/country_model.dart';
import '../../../remote/service.dart';
import 'countries_state.dart';


class CountriesCubit extends Cubit<CountriesState> {
  late ServiceApi api;
  late List<CountryModel> list;
  late List<CountryModel> data;
  late bool isSearch;

  CountriesCubit() : super(IsLoading()) {
    api = ServiceApi();
    list = [];
    data = [];
    isSearch = false;
    getCountries();
  }

  void getCountries() async {
    try{
      emit(IsLoading());
      CountryDataModel response = await api.getCountries();
      print("${response.status.status}");
      if(response.status.status==200){
        list = response.data;
        emit(OnDataSuccess(list));
      }
    }catch (e){
      print("dkdkkdkd${e}");
      OnError(e.toString());
    }
  }

  void search(String query){
    data = [];
    print("query${query}");
    if(query.isEmpty){
      isSearch = false;
      emit(OnDataSuccess(list));
    }else{
      isSearch = true;
      for(CountryModel model in list){
        if(model.ar_name.toLowerCase().contains(query)||model.en_name.toLowerCase().contains(query)){
          data.add(model);
          print("data=>${data.length}");
        }
      }

      emit(OnDataSuccess(data));

    }

  }
}

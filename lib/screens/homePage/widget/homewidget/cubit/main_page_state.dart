part of 'main_page_cubit.dart';

@immutable
abstract class MainPageState {}

class IsLoadingData extends MainPageState {

  IsLoadingData();
}




class OnDataSuccess extends MainPageState {
  List<Sites> list;

  OnDataSuccess(this.list);
}

class OnError extends MainPageState {
  String error;
  OnError(this.error);
}

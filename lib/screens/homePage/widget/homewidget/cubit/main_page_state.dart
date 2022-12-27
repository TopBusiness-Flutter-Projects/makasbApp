part of 'main_page_cubit.dart';

@immutable
abstract class MainPageState {}

class IsLoadingData extends MainPageState {

  IsLoadingData();
}


class UserData extends MainPageState {
  UserModel  usermodel;
  UserData(this.usermodel);
}



class OnDataSuccess extends MainPageState {
  List<Sites> list;

  OnDataSuccess(this.list);
}
class OnSliderDataSuccess extends MainPageState {
  List<SliderModel> list;

  OnSliderDataSuccess(this.list);
}

class OnError extends MainPageState {
  String error;
  OnError(this.error);
}

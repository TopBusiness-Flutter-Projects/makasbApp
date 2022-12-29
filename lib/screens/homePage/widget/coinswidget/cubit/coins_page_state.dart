part of 'coins_page_cubit.dart';

@immutable
abstract class CoinsPageState {}

class IsLoadingData extends CoinsPageState {

  IsLoadingData();
}


class UserData extends CoinsPageState {
  UserModel  usermodel;
  UserData(this.usermodel);
}
class OnOrderSuccess extends CoinsPageState {
  PaymentDataModel model;
  OnOrderSuccess(this.model);
}



class OnDataSuccess extends CoinsPageState {
  List<Points> list;

  OnDataSuccess(this.list);
}
class OnSliderDataSuccess extends CoinsPageState {
  List<SliderModel> list;

  OnSliderDataSuccess(this.list);
}

class OnError extends CoinsPageState {
  String error;
  OnError(this.error);
}

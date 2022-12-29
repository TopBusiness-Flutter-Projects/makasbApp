part of 'all_coins_page_cubit.dart';

@immutable
abstract class AllCoinsPageState {}

class IsLoadingData extends AllCoinsPageState {

  IsLoadingData();
}


class UserData extends AllCoinsPageState {
  UserModel  usermodel;
  UserData(this.usermodel);
}

class OnOrderSuccess extends AllCoinsPageState {
  PaymentDataModel model;
  OnOrderSuccess(this.model);
}

class OnDataSuccess extends AllCoinsPageState {
  List<Points> list;

  OnDataSuccess(this.list);
}
class OnSliderDataSuccess extends AllCoinsPageState {
  List<SliderModel> list;

  OnSliderDataSuccess(this.list);
}

class OnError extends AllCoinsPageState {
  String error;
  OnError(this.error);
}

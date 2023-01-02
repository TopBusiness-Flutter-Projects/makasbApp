part of 'sites_page_cubit.dart';

@immutable
abstract class SitesPageState {}

class IsLoadingData extends SitesPageState {

  IsLoadingData();
}


class UserData extends SitesPageState {
  UserModel  usermodel;
  UserData(this.usermodel);
}

class OnOrderSuccess extends SitesPageState {
  StatusResponse model;
  OnOrderSuccess(this.model);
}

class OnDataSuccess extends SitesPageState {
  List<Sites> list;

  OnDataSuccess(this.list);
}


class OnError extends SitesPageState {
  String error;
  OnError(this.error);
}

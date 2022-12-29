part of 'home_page_cubit.dart';

abstract class HomePageState {}

class MainPageInitial extends HomePageState {

}

// class MainPageIndexUpdated extends HomePageState {
//   int index;
//   MainPageIndexUpdated(this.index) ;
//
// }
class UserData extends HomePageState{
  UserModel  usermodel;
  UserData(this.usermodel);
}


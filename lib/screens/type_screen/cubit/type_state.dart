
import 'package:flutter/cupertino.dart';

import '../../../models/type.dart';

@immutable
abstract class TypeState {}

class IsLoading extends TypeState {}

class OnDataSuccess extends TypeState {
  List<TypeModel> data;
  OnDataSuccess(this.data);
}

class OnError extends TypeState {
  String error;

  OnError(this.error);
}

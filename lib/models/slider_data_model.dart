
import 'package:flutter/material.dart';
import 'package:makasb/models/slider.dart';
import 'package:makasb/models/status_resspons.dart';

import 'country_model.dart';

class SliderDataModel{
  late List<SliderModel> data;
  late StatusResponse status;

  SliderDataModel.fromJson(Map<String,dynamic> json){
    data = [];
    json['data'].forEach((v)=>data.add(SliderModel.fromJson(v)));
    status = StatusResponse.fromJson(json);
  }
}
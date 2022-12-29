import 'package:makasb/models/status_resspons.dart';

class PaymentDataModel {
  late String data;
  late StatusResponse status;
  late String token;

  PaymentDataModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data']  ??"";
    status = StatusResponse.fromJson(json);
  }
}

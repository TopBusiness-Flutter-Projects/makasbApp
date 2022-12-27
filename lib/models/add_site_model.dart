import 'package:email_validator/email_validator.dart';

class AddSideModel {
  int user_id = 0;
  int site_type = 0;
  String title = "";
  List<int> country = [];
  String url = "";
  String total_clicks_limit = "";
  String daily_clicks_limit = "";
  String points_for_click = "";

  bool isDataValid() {


    if (user_id!=0 &&
        site_type!=0 &&
        title.isNotEmpty &&
        country.isNotEmpty &&
        url.isNotEmpty&&
        total_clicks_limit.isNotEmpty&&
        daily_clicks_limit.isNotEmpty&&
        points_for_click.isNotEmpty) {
      return true;
    }

    return false;
  }
 static  Map<String, dynamic> toJson(AddSideModel addModel) {
    return {
      'user_id':addModel.user_id,
      'site_type':addModel.site_type,
      'title':addModel.title,
      'url':addModel.url,
      'total_clicks_limit':addModel.total_clicks_limit,
      'points_for_click':addModel.points_for_click,
      'daily_clicks_limit':addModel.daily_clicks_limit,
      'country[]':addModel.country



    };
  }
}

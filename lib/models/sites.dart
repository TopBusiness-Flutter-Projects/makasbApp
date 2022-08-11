import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';
class Sites {
 late String id;
 late String userId;
 late String siteType;
 late String title;
 late String url;
 late String dailyClicksLimit;
 late String totalClicksLimit;
 late String neededClicks;
 late String poStringsForClick;
 late String status;
 late String createdAt;
 late String updatedAt;
 late Type type;

  Sites(
    );

  Sites.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    userId = json['user_id'] as String;
    siteType = json['site_type'] as String;
    title = json['title'] as String;
    url = json['url'] as String;
    dailyClicksLimit = json['daily_clicks_limit'] as String;
    totalClicksLimit = json['total_clicks_limit'] as String;
    neededClicks = json['needed_clicks'] as String;
    poStringsForClick = json['poStrings_for_click'] as String;
    status = json['status'] as String;
    createdAt = json['created_at'] as String;
    updatedAt = json['updated_at'] as String;
    type = Type.fromJson(json['type']);
  }
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id'] = this.id;
   data['user_id'] = this.userId;
   data['sitetype'] = this.siteType;
   data['title'] = this.title;
   data['url'] = this.url;
   data['daily_clicks_limit'] = this.dailyClicksLimit;
   data['total_clicks_limit'] = this.totalClicksLimit;
   data['needed_clicks'] = this.neededClicks;
   data['poStrings_forclick'] = this.poStringsForClick;
   data['status'] = this.status;
   data['created_at'] = this.createdAt;
   data['updated_at'] = this.updatedAt;
   data['type'] = type.toJson(type);
   return data;
 }
}





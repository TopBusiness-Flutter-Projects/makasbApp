import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';
class Sites {
 late int id;
 late int userId;
 late int siteType;
 late String title;
 late String url;
 late int dailyClicksLimit;
 late int totalClicksLimit;
 late int neededClicks;
 late int pointsForClick;
 late String status;
 late String createdAt;
 late String updatedAt;
 late Type type;

  Sites(
    );

  Sites.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = json['user_id'] as int;
    siteType = json['site_type'] as int;
    title = json['title'] as String;
    url = json['url'] as String;
    dailyClicksLimit = json['daily_clicks_limit'] as int;
    totalClicksLimit = json['total_clicks_limit'] as int;
    neededClicks = json['needed_clicks'] as int;
    pointsForClick = json['points_for_click'] as int;
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
   data['points_forclick'] = this.pointsForClick;
   data['status'] = this.status;
   data['created_at'] = this.createdAt;
   data['updated_at'] = this.updatedAt;
   if (this.type != null) {
     data['type'] = this.type.toJson(type);
   }
   return data;
 }
}





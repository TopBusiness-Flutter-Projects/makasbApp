import 'package:makasb/models/sites.dart';
import 'package:makasb/models/type.dart';
class Sites {
 late int id;
 late int userId;
 late int siteType;
 late String title;
 late String url;
 late int totalClicksLimit;
 late int neededClicks;
 late int points_for_click;
 late String status;
 late String createdAt;
 late String updatedAt;
 late String share;
 late TypeModel type;
 late int dailyClicksLimit;

  Sites(
    );

  Sites.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??0;
    userId = json['user_id'] ??0;
    siteType = json['site_type'] ??0;
    title = json['title'] ??"";
    url = json['url'] ??"";
    dailyClicksLimit = json['daily_clicks_limit'] ??0;
    totalClicksLimit = json['total_clicks_limit'] ??0;
    neededClicks = json['needed_clicks'] ??0;
    points_for_click = json['points_for_click'] ??0;
    status = json['status'] ??"";
    share = json['share'] ??"";
    createdAt = json['created_at'] ??"";
    updatedAt = json['updated_at'] ??"";
    if(json['type']!=null){
    type = TypeModel.fromJson(json['type']);
  }}
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
   data['points_for_click'] = this.points_for_click;
   data['status'] = this.status;
   data['share'] = this.share;
   data['created_at'] = this.createdAt;
   data['updated_at'] = this.updatedAt;
   data['type'] = type.toJson(type);
   return data;
 }
}





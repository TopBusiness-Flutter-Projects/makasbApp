// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  SettingModel({
    this.data,
    this.message,
    this.code,
  });

  final SettingData? data;
  final String? message;
  final int? code;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    data: SettingData.fromJson(json["data"]),
    message: json["msg"],
    code: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "msg": message,
    "status": code,
  };
}

class SettingData {
  SettingData({
    this.facebook, this.insta, this.snap, this.twitter,
    this.id,
    this.about_us,
    this.about_us_en,
    this.terms,
    this.terms_en,
    this.privacy,
    this.privacy_en,
  });


 
 

  final int? id;
  final String? about_us;
  final String? about_us_en;
  final String? terms;
  final String? terms_en;
  final String? privacy;
  final String? privacy_en;
  final String? facebook;
  final String? insta;
  final String? snap;
  final String? twitter;

  factory SettingData.fromJson(Map<String, dynamic> json) => SettingData(
    id: json["id"],
    about_us: json["about_us"],
    about_us_en: json["about_us_en"],
    terms: json["terms"],
    terms_en: json["terms_en"],
    privacy: json["privacy"],
    privacy_en: json["privacy_en"],
    facebook:json['facebook'],
    insta:json['insta'],
    snap:json['snap'],
    twitter:json['twitter'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "about_us": about_us,
    "about_us_en": about_us_en,
    "terms": terms,
    "terms_en": terms_en,
    "privacy": privacy,
    "privacy_en": privacy_en,
    "facebook": facebook,
    "insta": insta,
    "snap": snap,
    "twitter": twitter,
  };
}

class Type {
  late int id;
  late String titleAr;
  late String titleEn;
  late String createdAt;
  late String updatedAt;

  Type();

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    titleAr = json['title_ar'] as String;
    titleEn = json['title_en'] as String;
    createdAt = json['created_at'] as String;
    updatedAt = json['updated_at'] as String;
  }

   Map<String,dynamic> toJson(Type type) {
    return{

      'id':type.id,
      'title_ar':type.titleAr,
      'title_en':type.titleEn,
      'created_at':type.createdAt,
      'updated_at':type.updatedAt
    };

  }
}
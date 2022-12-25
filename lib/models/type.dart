class TypeModel {
  late int id;
  late String titleAr;
  late String titleEn;
  late String createdAt;
  late String updatedAt;

  TypeModel.initValues(){
    id = 0;
    titleAr ='إختر النوع';
    titleEn = 'Choose Type';
  }
  TypeModel(this.id, this.titleAr, this.titleEn);

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??0;
    titleAr = json['title_ar'] ??"";
    titleEn = json['title_en'] ??"";
    createdAt = json['created_at'] ??"";
    updatedAt = json['updated_at'] ??"";
  }

   Map<String,dynamic> toJson(TypeModel type) {
    return{

      'id':type.id,
      'title_ar':type.titleAr,
      'title_en':type.titleEn,
      'created_at':type.createdAt,
      'updated_at':type.updatedAt
    };

  }
}
class TypeModel {
  late int id;
  late String titleAr;
  late String titleEn;
  late String createdAt;
  late String updatedAt;
  late String desctitle;
  late String desc;
  late String action;


  TypeModel.initValues(){
    id = 0;
    titleAr ='إختر النوع';
    titleEn = 'Choose Type';

  }
  TypeModel(this.id, this.titleAr, this.titleEn,this.desctitle,this.desc,this.action);

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
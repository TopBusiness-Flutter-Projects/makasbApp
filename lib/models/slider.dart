class SliderModel{
  int? id;
  String? descAr;
  String? descEn;
  String? btnTitleAr;
  String? btnTitleEn;
  String? btnLink;
  String? image;
  String? createdAt;
  String? updatedAt;

  SliderModel(
      {this.id,
        this.descAr,
        this.descEn,
        this.btnTitleAr,
        this.btnTitleEn,
        this.btnLink,
        this.image,
        this.createdAt,
        this.updatedAt});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descAr = json['desc_ar'];
    descEn = json['desc_en'];
    btnTitleAr = json['btn_title_ar'];
    btnTitleEn = json['btn_title_en'];
    btnLink = json['btn_link'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
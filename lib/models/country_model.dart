class CountryModel {
  late int id;
  late String code;
  late String name;
  late String en_name;
  late String ar_name;
  late String calling_code;


  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??0;
    code = json['code']??"";
    name = json['name'] ??"";
    en_name = json['en_name'] ??"";
    ar_name = json['ar_name'] ??"";
    calling_code = json['calling_code'] ??"";
  }

  CountryModel.initValues(){
    id = 0;
    ar_name ='إختر الدولة';
    en_name = 'Choose Country';
  }
  static Map<String, dynamic> toJson(CountryModel cityModel) {
   return {
     'id':cityModel.id,
     'code':cityModel.code,
     'name':cityModel.name,
     'en_name':cityModel.en_name,
     'ar_name':cityModel.ar_name,
     'calling_code':cityModel.calling_code

   };
  }
}

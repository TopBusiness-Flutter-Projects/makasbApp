class StatusResponse{
  late int status =0;
  late String msg="";

  StatusResponse();
  StatusResponse.fromJson(Map<String,dynamic> json){
    status = json['status'] as int;
    msg = json ['msg'].toString();
  }

}
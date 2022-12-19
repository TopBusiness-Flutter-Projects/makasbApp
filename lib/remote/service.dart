
//
import 'package:dio/dio.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/login_model.dart';
import 'package:makasb/models/mysites.dart';
import 'package:makasb/models/user_model.dart';
import 'package:makasb/remote/handle_exeption.dart';

import '../models/user_sign_up_model.dart';

class ServiceApi {
  late Dio dio;

  ServiceApi() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: 1000 * 60 * 2,
        receiveTimeout: 1000 * 60 * 2,
        receiveDataWhenStatusError: true,
        contentType: "application/json",
        headers: {'Content-Type': 'application/json'});
    dio = Dio(baseOptions);
  }




Future<UserModel> login(LoginModel loginModel) async {
  try {
    var fields = FormData.fromMap(
        {'email': loginModel.email, 'password': loginModel.password});

    Response response = await dio.post('api/login', data: fields);

    return UserModel.fromJson(response.data);
  } on DioError catch (e) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    throw errorMessage;
  }
}
  Future<UserModel> signUp(UserSignUpModel model) async {
    var fields = FormData.fromMap({});
    try {
      if (model.imagePath.isNotEmpty) {
        fields = FormData.fromMap({
          'user_name': model.user_name,
          'email': model.email,
          'password': model.password,
          'password_confirmation': model.password_confirmation,
          'image': await MultipartFile.fromFile(model.imagePath)
        });
      } else {
        fields = FormData.fromMap({
          'user_name': model.user_name,
          'email': model.email,
          'password': model.password,
          'password_confirmation': model.password_confirmation,
        });
      }
      print("dlldldl${fields.fields}");
      Response response = await dio.post('api/register', data: fields);
      print("Flflflfl${response.toString()}");
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${e}');

      throw errorMessage;
    }
  }

  Future<MySites> getmySitesData(String user_id) async {
    try {
      Response response;
      BaseOptions baseOptions = dio.options;
      CancelToken cancelToken = CancelToken();

      baseOptions.headers = {'Content-Type': 'application/json'};
      dio.options = baseOptions;

      response = await dio.get('api/mySites',
          queryParameters: {'user_id': user_id}, cancelToken: cancelToken);

      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
      }
     // print("dlldldldl${response.toString()}");
      return MySites.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }


}

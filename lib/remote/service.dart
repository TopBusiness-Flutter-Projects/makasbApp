
//
import 'package:dio/dio.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/login_model.dart';
import 'package:makasb/models/user_model.dart';
import 'package:makasb/remote/handle_exeption.dart';

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
        {'phone_code': loginModel.email, 'phone': loginModel.password});

    Response response = await dio.post('api/auth/login', data: fields);

    return UserModel.fromJson(response.data);
  } on DioError catch (e) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    throw errorMessage;
  }
}

// Future<UserDataModel> signUp(UserSignUpModel model) async {
//   var fields = FormData.fromMap({});
//   try {
//     if (model.imagePath.isNotEmpty) {
//       fields = FormData.fromMap({
//         'first_name': model.firstName,
//         'last_name': model.lastName,
//         'email': model.email,
//         'phone_code': model.phone_code,
//         'phone': model.phone,
//         'city_id': model.cityId,
//         'birthdate': model.dateOfBirth,
//         'image': await MultipartFile.fromFile(model.imagePath)
//       });
//     } else {
//       fields = FormData.fromMap({
//         'first_name': model.firstName,
//         'last_name': model.lastName,
//         'email': model.email,
//         'phone_code': model.phone_code,
//         'phone': model.phone,
//         'city_id': model.cityId,
//         'birthdate': model.dateOfBirth,
//       });
//     }
//
//     Response response = await dio.post('api/auth/register', data: fields);
//     return UserModel.fromJson(response.data);
//   } on DioError catch (e) {
//     final errorMessage = DioExceptions.fromDioError(e).toString();
//     print('Error=>${errorMessage}');
//
//     throw errorMessage;
//   }
// }


}

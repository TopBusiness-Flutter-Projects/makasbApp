//
import 'package:dio/dio.dart';
import 'package:makasb/constants/app_constant.dart';
import 'package:makasb/models/login_model.dart';
import 'package:makasb/models/mysites.dart';
import 'package:makasb/models/status_resspons.dart';
import 'package:makasb/models/user_model.dart';
import 'package:makasb/remote/handle_exeption.dart';

import '../models/add_site_model.dart';
import '../models/country_data_model.dart';
import '../models/edit_profile_model.dart';
import '../models/new_password_model.dart';
import '../models/payment_model.dart';
import '../models/points_data.dart';
import '../models/setting_model.dart';
import '../models/slider_data_model.dart';
import '../models/type_data_model.dart';
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
          'phone': model.phone,
          'country': model.id,
          'password': model.password,
          'password_confirmation': model.password_confirmation,
          'image': await MultipartFile.fromFile(model.imagePath)
        });
      } else {
        fields = FormData.fromMap({
          'user_name': model.user_name,
          'email': model.email,
          'phone': model.phone,
          'country': model.id,
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

  Future<MySites> getmySitesData(String user_id, String token) async {
    try {
      Response response;
      BaseOptions baseOptions = dio.options;
      CancelToken cancelToken = CancelToken();

      baseOptions.headers = {'Content-Type': 'application/json'
      ,
        'Authorization':"Bearer ${token}"
      };
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
  Future<MySites> getSitesData( String token, int type_id) async {
    try {
      Response response;
      BaseOptions baseOptions = dio.options;
      CancelToken cancelToken = CancelToken();

      baseOptions.headers = {'Content-Type': 'application/json'
        ,
        'Authorization':"Bearer ${token}"
      };
      dio.options = baseOptions;

      response = await dio.get('api/posts',
          queryParameters: {'type_id':type_id}, cancelToken: cancelToken);

      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
      }
       print("dlldldldl${response.toString()}");
      return MySites.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<PointsDataModel> getPoints( String token) async {
    try {
      Response response;
      BaseOptions baseOptions = dio.options;
      CancelToken cancelToken = CancelToken();

      baseOptions.headers = {'Content-Type': 'application/json'
        ,
        'Authorization':"Bearer ${token}"
      };
      dio.options = baseOptions;

      response = await dio.get('api/latestPoints',
          cancelToken: cancelToken);

      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
      }
      // print("dlldldldl${response.toString()}");
      return PointsDataModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<PointsDataModel> getAllPoints( String token) async {
    try {
      Response response;
      BaseOptions baseOptions = dio.options;
      CancelToken cancelToken = CancelToken();

      baseOptions.headers = {'Content-Type': 'application/json'
        ,
        'Authorization':"Bearer ${token}"
      };
      dio.options = baseOptions;

      response = await dio.get('api/allPoints',
          cancelToken: cancelToken);

      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
      }
      // print("dlldldldl${response.toString()}");
      return PointsDataModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<CountryDataModel> getCountries() async {
    try {
      // print("dldlldl");
      Response response = await dio.get('api/countries');
      return CountryDataModel.fromJson(response.data);
    } on DioError catch (e) {
      print("dldlldl${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<TypeDataModel> getType(UserModel userModel) async {
    try {
      // print("dldlldl");
      BaseOptions options = dio.options;
      options.headers = {'Authorization': "Bearer ${userModel.data.token}"};
      dio.options=options;
      Response response = await dio.get('api/postTypes');
      return TypeDataModel.fromJson(response.data);
    } on DioError catch (e) {
      print("dldlldl${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<SliderDataModel> getSliders() async {
    try {
      print('slider');
      Response response = await dio.get('api/sliders');
      return SliderDataModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<StatusResponse> addSite(AddSideModel model,String user_token) async {
    var fields = FormData.fromMap({});
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization':"Bearer ${user_token}"
      };
      dio.options = options;
      fields = FormData.fromMap(AddSideModel.toJson(model));

      print("dlldldl${fields.fields}");
      Response response = await dio.post('api/addPost', data: fields);
      print("Flflflfl${response.toString()}");
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${e}');

      throw errorMessage;
    }
  }
  Future<StatusResponse> deleteSite(
      String user_token, int post_id) async {
    var fields =
    FormData.fromMap({'site_id': post_id});
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization':"Bearer ${user_token}"
      };
      dio.options = options;
      Response response =
      await dio.post('api/deleteMySite', data: fields);
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${errorMessage}');

      throw errorMessage;
    }
  }

  Future<PaymentDataModel> buyPoint(int  point_id, UserModel userModel) async {
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization': "Bearer ${userModel.data.token}"};
      dio.options = options;


      Response response =
      await dio.get('api/pointsPrices', queryParameters: {
        'user_id': userModel.data.id,
        'point_id': point_id
      });
      print("sssss${response.data}");
      return PaymentDataModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<SettingModel> getSetting() async {
    try {
      Response response = await dio.get('api/setting');
      print("Ddldldl${response}");
      return SettingModel.fromJson(response.data);
    } on DioError catch (e) {
      print("D;dldll${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<UserModel> getProfileByToken(String token) async {
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization': "Bearer ${token}"};
      dio.options = options;
      Response response = await dio.get('api/my-profile');
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<StatusResponse> logout(String user_token, int user_id) async {
    var fields = FormData.fromMap({'user_id': user_id});
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization':"Bearer ${user_token}"};
      dio.options = options;
      Response response = await dio.post('api/logout', data: fields);
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${errorMessage}');

      throw errorMessage;
    }
  }
  Future<StatusResponse> deleteAccount(String user_token, int user_id) async {
    var fields = FormData.fromMap({'user_id': user_id});
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization':"Bearer ${user_token}"};
      dio.options = options;
      Response response = await dio.post('api/deleteMyAccount', data: fields);
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${errorMessage}');

      throw errorMessage;
    }
  }

  Future<UserModel> updateProfile(
      EditProfileModel model, String user_token,int user_id) async {
    var fields = FormData.fromMap({});
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization': "Bearer ${user_token}"};
      dio.options = options;

      if (model.imagePath.isNotEmpty && !model.imagePath.startsWith('http')) {
        fields = FormData.fromMap({
          'user_id':user_id,
          'user_name': model.user_name,
          'email': model.email,
          'image': await MultipartFile.fromFile(model.imagePath)
        });
      } else {
        fields = FormData.fromMap({
          'user_id':user_id,
          'user_name': model.user_name,
          'email': model.email,
          });
      }

      Response response =
      await dio.post('api/updateProfile', data: fields);
      print("Slslsl${response}");
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${errorMessage}');

      throw errorMessage;
    }
  }
  Future<StatusResponse> checkSites(int  site_id, UserModel userModel) async {
    try {
      BaseOptions options = dio.options;
      options.headers = {'Authorization': "Bearer ${userModel.data.token}"};
      dio.options = options;


      Response response =
      await dio.post('api/checkUserView', data: {
        'user_id': userModel.data.id,
        'site_id': site_id
      });
      print("sssss${response.data}");
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<StatusResponse> sendcode(String email) async {
    try {



      Response response =
      await dio.post('api/password/email', data: {
        'email': email
      });
      print("sssss${response.data}");
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<StatusResponse> checkcode(String email,String code) async {
    try {



      Response response =
      await dio.post('api/password/code/check', data: {
        'email': email,
        'code': code

      });
      print("sssss${response.data}");
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<StatusResponse> newpassword(NewPasswordModel model) async {
    var fields = FormData.fromMap({});
    try {

        fields = FormData.fromMap({
          'code': model.code,
          'email': model.email,
          'password': model.password,
          'password_confirmation': model.confirm_password,
        });

      print("dlldldl${fields.fields}");
      Response response = await dio.post('api/password/reset', data: fields);
      print("Flflflfl${response.toString()}");
      return StatusResponse.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print('Error=>${e}');

      throw errorMessage;
    }
  }


}

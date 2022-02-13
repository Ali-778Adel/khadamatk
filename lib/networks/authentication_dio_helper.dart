import 'package:dio/dio.dart';

class AuthenticationDioHelper {
  static Dio? dio;

  static void initAuthDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://cleaning.3m-erp.com/khadamaty/api',
          receiveDataWhenStatusError: true,
          headers: {'Accept': 'application/json'}),
    );
    print ('dio is not equall null');
  }

  static Future<Response> sendUserData(
      {required String url,
      required Map<String, dynamic> data,
      String? token}) async {
    dio!.options.headers = { 'Authorization': token};
    return await dio!.post(url, data: data).catchError((error){
      print('error in send data in dio package${error.toString()}');
    });
  }
}

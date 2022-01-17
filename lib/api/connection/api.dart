import 'package:dio/dio.dart';

class ApiUtil {
  static Future<Dio> createDio() async {
    var dio = Dio(
      BaseOptions(
          baseUrl: 'https://mangajj.herokuapp.com/',
          headers: {
            "Accept": "application/json",
            'Access-Control-Allow-Origin': 'true'
          },
          validateStatus: (status) {
            return status! <= 500;
          }),
    );
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 13000;
    return dio;
  }

  static String getUserExceptionMessage(DioError? dioError) {
    return '${dioError!.response!.statusCode}: ${dioError.response!.statusMessage}.';
  }
}

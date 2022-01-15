import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mangajj/controllers/job.controller.dart';

class DioExceptions implements Exception {
  final jobController = GetIt.I.get<JobController>();

  DioExceptions.fromDioError(DioError dioError) {
    jobController.updateStatusConnection();

    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        if (jobController.isConnected) {
          message = "Falha na conexão com o servidor";
        } else {
          message = "Falha na conexão com a Internet";
        }
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}

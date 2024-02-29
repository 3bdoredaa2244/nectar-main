import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailures extends Failure {
  ServerFailures(super.errorMessage);
  factory ServerFailures.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('connection time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailures('send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailures('receive time out with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailures('bad Certificate with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailures(
            'Your internet connection is not stable,Please try agine later!');
      case DioExceptionType.cancel:
        return ServerFailures('Request to ApiServer was canceled');
      case DioExceptionType.unknown:
        return ServerFailures('Oops unknown error,please try again');
      default:
        return ServerFailures('Oops unknown error,please try again');
    }
  }
  factory ServerFailures.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('your request not found ,please try again');
    } else if (statusCode == 500) {
      return ServerFailures('internal server error ,please try later!');
    } else {
      return ServerFailures('Oops unknown error,please try again');
    }
  }
}

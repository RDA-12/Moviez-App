import 'package:dio/dio.dart';

import '../resources/strings.dart';

String dioErrorHandler(Exception e) {
  if (e is DioError) {
    if (e.type == DioErrorType.connectTimeout) {
      return kConnectionTimeout;
    } else {
      return kServerError;
    }
  }
  return kUnknownError;
}

import 'package:dio/dio.dart';

import 'errorModel.dart';
import 'handleServerException.dart';

void handleDioExceptions(DioError e) {
  if (e.response != null) {
    final errorData = e.response!.data;
    final errorModel = ErrorModel.fromJson(errorData);
    throw ServerException(errModel: errorModel);
  } else {
    throw ServerException(errModel: ErrorModel(status: 0, errorMsg: e.error?.toString() ?? 'An unknown error occurred'));
  }
}
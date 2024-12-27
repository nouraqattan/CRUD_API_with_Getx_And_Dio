import 'errorModel.dart';
class ServerException implements Exception {
  final ErrorModel errModel;
  ServerException({required this.errModel});
}
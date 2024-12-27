class ErrorModel {
  final int status;
  final String errorMsg;

  ErrorModel({required this.status, required this.errorMsg});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'] ?? 0,
      errorMsg: jsonData['message'] ?? 'An unknown error occurred',
    );
  }
}
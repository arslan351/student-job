import 'package:dio/dio.dart';

class OtpResult {
  final bool isSuccess;
  final Map<String, dynamic>? data;
  final String? errorMessage;
  final int? statusCode;

  const OtpResult.success(this.data)
    : isSuccess = true,
      errorMessage = null,
      statusCode =200;

  const OtpResult.failure({
    required this.errorMessage,
    this.statusCode,
    this.data,
  })  : isSuccess = false;

  factory OtpResult.fromException(DioException e) {
    final msg = e.response?.data?['error'] ?? e.message ?? 'Erreur réseau inattendue';
    return OtpResult.failure(
      errorMessage: msg,
      statusCode: e.response?.statusCode,
    );
  }
}
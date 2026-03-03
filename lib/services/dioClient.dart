import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();

  late final Dio _dio;

  Dio get dio => _dio;


  void initialize() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com', // change par ton API réelle
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ton_token' → à ajouter via interceptor si besoin
        },

      ),
    );

    // Intercepteur pour logs (super utile en dev)
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print(obj), // ou utilise logger package si tu veux mieux
      ),
    );

    // Optionnel : Intercepteur pour ajouter token automatiquement
    // _dio.interceptors.add(TokenInterceptor());

    // Optionnel : Intercepteur pour gérer les erreurs globales (401 → refresh token, etc.)

  }

  // Méthode GET simple
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  // Méthode POST
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioException e) {
    // Exemples de gestion
    if (e.type == DioExceptionType.connectionTimeout) {
      print('Timeout !');
    } else if (e.response?.statusCode == 401) {
      print('Non autorisé → rediriger vers login ?');
    }
    // Tu peux throw une custom exception ici si tu veux
  }
}
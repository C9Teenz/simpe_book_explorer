import 'package:dio/dio.dart';

import 'api_end_point.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoint.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          // Mapping error Dio menjadi pesan ramah pengguna sesuai requirement
          if (e.type == DioExceptionType.connectionError ||
              e.type == DioExceptionType.connectionTimeout) {
            return handler.reject(
              DioException(
                requestOptions: e.requestOptions,
                error: 'Koneksi terputus. Silakan coba lagi.',
                type: DioExceptionType.unknown,
              ),
            );
          }
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}

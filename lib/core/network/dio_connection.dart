import 'package:dio/dio.dart';
import 'package:x_projects_task/core/network/end_point.dart';

class DioConnection {
  static DioConnection? _instance;
  late final Dio _dio;

  factory DioConnection() {
    _instance ??= DioConnection._internal();
    return _instance!;
  }

  DioConnection._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters.addAll({'apiKey': EndPoint.apiKey});
          return handler.next(options);
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);

      return _handleResponse(response);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Unexpected error: ${response.statusMessage}");
    }
  }

  String _handleError(dynamic error) {
    if (error is DioException && error.response != null) {
      final responseData = error.response!.data;
      if (responseData is Map && responseData.containsKey("message")) {
        return responseData["message"];
      }
      return 'Unexpected server error';
    } else {
      return 'Unknown error occurred';
    }
  }
}

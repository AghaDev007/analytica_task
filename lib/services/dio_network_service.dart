import 'dart:io';
import 'package:analytica_task/services/storage_services.dart';
import 'package:analytica_task/utils/widgets/api_urls/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get/instance_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioNetworkService {
  static final DioNetworkService _instance = DioNetworkService._internal();

  final Dio dio;

  factory DioNetworkService() {
    return _instance;
  }

  DioNetworkService._internal() : dio = Dio() {
    dio.options.connectTimeout = const Duration(milliseconds: 8000);

    const List<Duration> retryDelayEntries = [
      Duration(seconds: 2),
    ];

    dio.options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      validateStatus: (status) => true,
    );

    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      retries: 1,
      retryDelays: retryDelayEntries,
    ));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };

    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
    ));

    // dio.interceptors.add(LogoutInterceptor(dio));
  }

  Future<Response> get({
    required String requestURL,
    String? queryParameters,
  }) async {
    try {
      String url = requestURL;

      if (queryParameters != null) {
        url += '?$queryParameters';
      }

      Response response = await dio.get(url);

      return response;
    } catch (e) {
      throw Exception(
        'Failed to perform GET request for $requestURL $queryParameters: $e',
      );
    }
  }

  Future<Response> post({
    required String requestURL,
    Map<String, dynamic>? bodyParameters,
  }) async {
    try {
      final response = await dio.post(requestURL, data: bodyParameters);
      return response;
    } catch (e) {
      print('Dio Error: $e');
      throw Exception(
        'Failed to perform POST request for $requestURL: $e',
      );
    }
  }

  Future<Response> delete(String requestURL) async {
    try {
      final response = await dio.delete(requestURL);
      return response;
    } catch (e) {
      throw Exception(
        'Failed to perform DELETE request for $requestURL: $e',
      );
    }
  }

  Future<Response> put(
      String requestURL, Map<String, dynamic> parameters) async {
    try {
      final response = await dio.put(requestURL, data: parameters);
      return response;
    } catch (e) {
      throw Exception(
        'Failed to perform PUT request for $requestURL: $e',
      );
    }
  }
}

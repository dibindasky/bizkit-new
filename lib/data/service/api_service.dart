import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    // dio.options.connectTimeout = const Duration(seconds: 3);
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) async {
    //     final accessToken =
    //         await SecureStorage.getToken().then((token) => token.accessToken);
    //     dio.options.headers['Authorization'] = accessToken;
    //     options.headers['Authorization'] = accessToken;
    //     print(dio.options.headers);
    //     print(options.headers);
    //     return handler.next(options);
    //   },
    //   onError: (e, handler) async {},
    // ));
  }

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      final accessToken =
          await SecureStorage.getToken().then((token) => token.accessToken);
      _dio.options.headers.addAll(
        {
          'Authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'}
        },
      );
      print('api uri ==>  ${_dio.options.baseUrl + url}');
      final response =
          await _dio.get(url, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return await _retry(exception.requestOptions);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final accessToken =
          await SecureStorage.getToken().then((token) => token.accessToken);
      _dio.options.headers.addAll(
        {
          'Authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'}
        },
      );
      print('api uri ==>  ${_dio.options.baseUrl + url}');
      final response = await _dio.post(
        url,
        data: data is FormData ? data : data as Map<String, dynamic>?,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401 ||
          exception.response?.statusCode == 403) {
        await _refreshAccessToken();
        return await _retry(exception.requestOptions);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final accessToken =
          await SecureStorage.getToken().then((token) => token.accessToken);
      _dio.options.headers.addAll(
        {
          'Authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'}
        },
      );
      print('api uri ==>  ${_dio.options.baseUrl + url}');
      final response = await _dio.put(url,
          data: data is FormData ? data : data as Map<String, dynamic>?,
          queryParameters: queryParameters);
      return response;
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return await _retry(exception.requestOptions);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      final accessToken =
          await SecureStorage.getToken().then((token) => token.accessToken);
      _dio.options.headers.addAll(
        {
          'Authorization': "Bearer $accessToken",
          ...headers ?? {'content-Type': 'application/json'}
        },
      );
      print('api uri ==>  ${_dio.options.baseUrl + url}');
      final response =
          await _dio.delete(url, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 401) {
        await _refreshAccessToken();
        return await _retry(exception.requestOptions);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  _refreshAccessToken() async {
    try {
      print('=====================================================');
      print('=======================refresh=======================');
      print('=====================================================');
      final token =
          await SecureStorage.getToken().then((token) => token.refreshToken);
      final response = await Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl))
          .post(ApiEndPoints.refreshUrl, data: {'refresh': token});
      await SecureStorage.setAccessToken(accessToken: response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    try {
      final accessToken =
          await SecureStorage.getToken().then((token) => token.accessToken);
      _dio.options.headers['Authorization'] = "Bearer $accessToken";
      return await _dio.request(requestOptions.path,
          queryParameters: requestOptions.queryParameters,
          data: requestOptions.data);
    } catch (e) {
      rethrow;
    }
  }
}

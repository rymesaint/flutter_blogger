import 'dart:io';
import 'package:blogspot/src/constants/app.api.dart';
import 'package:blogspot/src/constants/app.config.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

// import 'auth.service.dart';

class HttpService {
  String host = AppApi.baseUrl;
  late BaseOptions baseOptions;
  late Dio dio;

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "gzip",
      HttpHeaders.userAgentHeader: 'Flutter (gzip)',
      'X-Goog-Api-Key': AppConfig.apiKey,
    };
  }

  HttpService() {
    baseOptions = BaseOptions(
      baseUrl: host,
      validateStatus: (status) {
        return status! <= 500;
      },
      // connectTimeout: 300,
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(DioCacheManager(
      CacheConfig(
        baseUrl: host,
        defaultMaxAge: const Duration(hours: 1),
      ),
    ).interceptor);
    // customization
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: false,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90,
    //   ),
    // );
  }

  //for get api calls
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool includeHeaders = true,
  }) async {
    //preparing the api uri/url
    String uri = "$host$url";

    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: await getHeaders(),
          );

    return dio.get(
      uri,
      options: mOptions,
      queryParameters: queryParameters,
    );
  }

  //for post api calls
  Future<Response> post(
    String url,
    body, {
    bool includeHeaders = true,
  }) async {
    //preparing the api uri/url
    String uri = "$host$url";

    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: await getHeaders(),
          );

    return dio.post(
      uri,
      data: body,
      options: mOptions,
    );
  }

  //for post api calls with file upload
  Future<Response> postWithFiles(
    String url,
    body, {
    bool includeHeaders = true,
  }) async {
    //preparing the api uri/url
    String uri = "$host$url";
    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: await getHeaders(),
          );

    Response response;

    try {
      response = await dio.post(
        uri,
        data: FormData.fromMap(body),
        options: mOptions,
      );
    } on DioError catch (error) {
      response = formatDioException(error);
    }

    return response;
  }

  //for patch api calls
  Future<Response> patch(String url, Map<String, dynamic> body) async {
    String uri = "$host$url";
    return dio.patch(
      uri,
      data: body,
      options: Options(
        headers: await getHeaders(),
      ),
    );
  }

  //for delete api calls
  Future<Response> delete(
    String url,
  ) async {
    String uri = "$host$url";
    return dio.delete(
      uri,
      options: Options(
        headers: await getHeaders(),
      ),
    );
  }

  Response formatDioException(DioError ex) {
    var response = Response(requestOptions: ex.requestOptions);
    response.statusCode = 400;
    try {
      if (ex.type == DioErrorType.connectTimeout) {
        response.data = {
          "message":
              "Connection timeout. Please check your internet connection and try again",
        };
      } else {
        response.data = {
          "message": ex.message,
        };
      }
    } on DioError catch (error) {
      response.statusCode = 400;
      response.data = {
        "message": error.message,
      };
    }

    return response;
  }
}

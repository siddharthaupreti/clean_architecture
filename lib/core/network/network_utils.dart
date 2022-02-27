import 'dart:async';

import 'package:clean_arc_str/core/error/exceptions.dart';
import 'package:clean_arc_str/core/network/baseModel/rest_response.dart';
import 'package:clean_arc_str/core/resources/app_url.dart';
import 'package:dio/dio.dart';

class NetworkUtil {
  late Dio _dio;

  NetworkUtil({required Dio dio}) {
    _dio = dio;

    ///Create Dio Object using baseOptions set receiveTimeout,connectTimeout
    BaseOptions options =
        BaseOptions(receiveTimeout: 20000, connectTimeout: 20000);
    options.baseUrl = AppUrl.BASE_URL;

    _dio.options = options;
    // _dio.interceptors.add(LogInterceptor());
  }

  ///used for calling Get Request
  Future<Response> get(String url, {Map<String, String>? query}) async {
    Response response = await _dio.get(url,
        queryParameters: query,
        options: Options(responseType: ResponseType.json));

    return response;
  }

  ///used for calling [POST] Request
  Future<Response> postQueryParams(
    String url, {
    Map<String, dynamic>? params,
    dynamic data,
    FormData? formData,
  }) async {
    print(
        "_________________________ PRE RESPONSE ___________________________\n");
    print(url);
    print(data);
    Response response = await _dio.post(
      url,
      queryParameters: params,
      data: data != null ? data : formData,
      options: Options(responseType: ResponseType.json),
    );
    print(response);
    print(
        "__________________________ POST RESPONSE ___________________________\n");

    return response;
  }

  dynamic parseNormalResponse(Response response) {
    try {
      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          // if (RestResponse.fromJson(response.data).status >= 200 &&
          //     RestResponse.fromJson(response.data).status <= 299) {
          return RestResponse.fromJson(response.data).responseData;
          // } else {
          //   throw ServerException(
          //       exceptionMessage: RestResponse.fromJson(response.data).message);
          // }
        } else {
          throw ServerException(exceptionMessage: response.statusMessage!);
        }
      }
    } catch (e) {
      print("error while parsing");
      throw e;
    }
  }

  Future<Response> put(String url,
      {Map<String, String>? params,
      Map<String, String>? data,
      dynamic jsonEncodeBody}) async {
    return await _dio.put(url,
        queryParameters: params,
        data: data != null ? data : jsonEncodeBody,
        options: Options(responseType: ResponseType.json));
  }

  Future<Response> patch(
    String url, {
    Map<String, String>? params,
    dynamic data,
    FormData? formData,
  }) async {
    print(
        "_____________________________ Ppatch RESPONSE_____________________________\n");
    Response response = await _dio.patch(
      url,
      queryParameters: params,
      data: data != null ? data : formData,
      options: Options(responseType: ResponseType.json),
    );

    print(
        "_____________________________Ppatch RESPONSE_____________________________\n");

    return response;
  }

  Future<Response> delete(String url, {Map<String, dynamic>? params}) async {
    Response response = await _dio.delete(url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json));

    return response;
  }
}

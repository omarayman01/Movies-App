import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view_model/database/network/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl, headers: {
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${EndPoints.accessToken}',
        // 'API-Key': EndPoints.apiKey
      }),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer ${EndPoints.accessToken}';
      // dio.options.headers = {};
      final Response response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      // debugPrint(
      //     'Get DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      // // debugPrint(response.toString());
      // debugPrint(
      //     'Finishhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      return response;
    } catch (e) {
      // debugPrint(
      //     'get ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(e.toString());
      // debugPrint(
      //     'Finishhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');

      rethrow;
    }
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {};
      final Response response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint(
          'post DONEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      // debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint(
          'post ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      debugPrint(e.toString());
      rethrow;
    }
  }
}

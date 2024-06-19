import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final String _baseUrl = "https://";
  final Dio _dio = Dio();

  Future<Response> post(
      {required String endPoint,
      @required dynamic body,
      Map<String, String>? headers,
      String? customURL,
      s}) async {
    try {
      Map<String, String>? apiHeaders;
      if (headers != null) {
        apiHeaders = headers;
      }
      dynamic apiBody;
      if (body != null) {
        apiBody = body;
      }
      String? url;
      if (customURL != null) {
        url = customURL;
      }
      var response = await _dio.post(
        url ?? "$_baseUrl$endPoint",
        data: apiBody,
        options: Options(
          headers: apiHeaders,
        ),
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex);
    } on Exception catch (ex) {
      throw Exception(ex);
    }
  }

  Future<Response> get(
      {required String endPoint, Map<String, String>? headers}) async {
    try {
      Map<String, String>? apiHeaders;
      if (headers != null) {
        apiHeaders = headers;
      }
      Response response = await _dio.get(
        "$_baseUrl$endPoint",
        options: Options(
          headers: apiHeaders,
        ),
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}

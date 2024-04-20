import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/_utils/api_response.dart';
import 'package:weather_app/_utils/enum.dart';

class APIcall<T> {
  Dio dio = Dio();

  Future<Either<Failure, T>> handleAPI({
    required String endPoint,
    dynamic body,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    APICallType apiCallType = APICallType.GET,
    required Future<Either<Failure, T>> Function(dynamic responseBody)
        handleSuccess,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      Map<String, dynamic> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      Options options = Options(
        headers: headers,
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      );

      try {
        late Response<dynamic> response;
        final uri = Uri.parse(endPoint);

        if (apiCallType == APICallType.GET) {
          response = await Dio().get(
            uri.toString(),
            queryParameters: queryParams,
            options: options,
          );
        }

        if (apiCallType == APICallType.POST) {
          response = await Dio().post(
            uri.toString(),
            data: body,
            options: options,
          );
        }

        if (apiCallType == APICallType.PUT) {
          response = await Dio().post(
            uri.toString(),
            data: body,
            options: options,
          );
        }
        if (apiCallType == APICallType.PUT) {
          response = await Dio().post(
            uri.toString(),
            data: body,
            options: options,
          );
        }

        final responseBody = response.data as dynamic;

        switch (response.statusCode) {
          case 200:
            final result = await handleSuccess(responseBody);
            return result;
          default:
            return left(Failure(
                code: response.statusCode ?? 500, message: "Server Error"));
        }
      } on SocketException catch (_) {
        debugPrint("Socket Exception: ${_.message}");
        return left(Failure(code: 601, message: "Please try again"));
      }
    } else {
      debugPrint("No Internet Connection");
      return left(Failure(code: 601, message: "Please try again"));
    }
  }
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';




class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    List<String> noRequiresAuthentication = [

    ];

    bool token = !noRequiresAuthentication.contains(options.path);
    if (token) {

      String token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzVkZDZmMmIyZGYyMmQ5Y2RjYzY5ZGE1NTM0NjNmOSIsInN1YiI6IjYyMzU0MGZlMWFjMjkyMDA0NjViNTQ2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.v23uI9-ayIGXtygBXw5Y-WqD5KUKvMZ8C4uWYEBu-Cw";
      String apiKey = "e75dd6f2b2df22d9cdcc69da553463f9";

      options.headers.addAll({"Authorization": "Bearer $token", "api_key" : "$apiKey"});
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    String errorDescription = "";
    log("${err.type} ${err.response?.data['message']}", name: "OnError Dio");
    switch (err.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        log("ENTRO EN EL CASE RESPONSE", name: "DioErrorType.response");
        errorDescription =
            "Received invalid status code: ${err.response?.statusCode} ";
        if (err.response?.statusCode == 401) {
          Future.delayed(Duration(seconds: 2), () {
         Get.snackbar("error", "las credenciales no coinciden con nueestro sistema verifique y vuelva a intentarlo",
         colorText: Colors.white, backgroundColor: Colors.red, duration: Duration(seconds: 4));
          // clearSession();
            });
         // Get.offAndToNamed(LoginPage.routeName);
        }
        if (err.response?.statusCode == 400) {
          Future.delayed(Duration(seconds: 2), () {
            Get.snackbar("error", "Todos los campos del formulario son requeridos",
                colorText: Colors.white, backgroundColor: Colors.red, duration: Duration(seconds: 4));
        }
          );}
        if (err.response?.statusCode == 406) {
          Future.delayed(Duration(seconds: 2), () {
            Get.snackbar("error", "el codigo no coincide con el enviado vuelva a intentarlo",
                colorText: Colors.white, backgroundColor: Colors.red, duration: Duration(seconds: 4));
          }
          );}

        var _data = Map<String, dynamic>.from(err.response?.data);
        log('${_data.containsKey("message") & _data["message"].contains("jwt")}');
        if (err.response?.data.containsKey("message") &&
            err.response?.data["message"].contains("jwt")) {
         // Get.offAndToNamed(LoginPage.routeName);
        }
        break;
      case DioErrorType.sendTimeout:
        // TODO: Handle this case.
        break;
    }
    print("errorDescription:\t" + errorDescription);
    err.error = errorDescription;
    return super.onError(err, handler);
  }


}

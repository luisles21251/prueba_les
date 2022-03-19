import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  Failure({this.message = "Undefined error"});
  @override
  List<Object> get props => [message!];
}

class ServerFailure extends Failure {
  final String? message;
  final int? statusCode;
  final Map? data;
  final DioError ?error;

  ServerFailure({this.error, this.message, this.data, this.statusCode});

  ServerFailure get extract {
    String? _message = '';
    int _statusCode;
    Map _data;
    _statusCode = error!.response!.statusCode!;
    if (error?.response?.data is Map) {
      if (error!.response!.data.containsKey('mensaje')) {
        _message = error?.response?.data['mensaje'];
      } else if (error?.response?.data.containsKey('message')) {
        _message = error?.response?.data['message'];
      } else if (error?.response?.data.containsKey('agotado')) {
        _message = error?.response?.data['agotado'];
      } else if (error?.response?.data.containsKey('titulo')) {
        _message = error?.response?.data['titulo'];
      } else if (error?.response?.data.containsKey('error')) {
        _message = error?.response?.data['error'];
      }
    } else if (error?.error is String) {
      _message = error?.error;
    } else if (error?.response?.data is String) {
      _message = error?.response?.data;
    }

    /* switch (error?.response.runtimeType) {
      case Response:
        _message = error?.response?.statusMessage;
        log(error?.response?.statusMessage ?? '', name: 'message3');
        break;
      case String:
        _message = error?.response?.statusMessage;
        log(error?.response?.statusMessage ?? '', name: 'message4');
        break;
    } */

    switch (error?.error.runtimeType) {
      case Map:
        break;
      case String:
      // log(error?.error?.toString() ?? '', name: 'error');
        break;
    }

    if(error?.response?.data is String){
      _data = {"data": error?.response?.data?.toString()};
    } else if(error?.response?.data is Map) {
      _data = error?.response?.data;
    } else {
      _data = {"data": error?.response?.data?.toString()};
    }

    String pattern = r'(\<\w*)((\s\/\>)|(.*\<\/\w*\>))';
    RegExp regExp = new RegExp(pattern);

    if(regExp.hasMatch(_message ?? ''))
      _message = 'Http status error [$_statusCode]';

    log(error.toString(),name: 'error');
    log(_statusCode.toString(),name: 'statusCode');
    log(_message.toString(),name: 'message');
    log(_data.toString(),name: 'data');

    return ServerFailure(
      error: error,
      message: _message,
      data: _data,
      statusCode: _statusCode,
    );
  }
}

class CacheFailure extends Failure {
  final dynamic error;
  final String? message;
  CacheFailure([this.error, this.message]);
  CacheFailure get get {
    String message = error.toString();
    log('$message', name: 'DatabaseException');
    return CacheFailure(
        error,
        message
    );
  }
}
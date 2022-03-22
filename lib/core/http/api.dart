
import 'package:dio/dio.dart';
import 'package:prueba_les/core/env/env.dart';
import '../../injection_container.dart';
import 'app_iterceptors.dart';

class ApiProvider {
  final String? _baseApiUrl = sl<Env>().api;
  Dio? dio;

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiUrl!));
    dio?.interceptors.add(AppInterceptors());
  }
}

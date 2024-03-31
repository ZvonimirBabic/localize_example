import 'package:dio/dio.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class NetworkService {
  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 5000),
    ),
  );
}

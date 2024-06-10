import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
 
  RequestInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
   // options.headers['Authorization'] = 'Bearer $staticToken';
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }
}

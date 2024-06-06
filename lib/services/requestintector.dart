import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  // static const String staticToken =
  //     '6|a4MloMRCiozHURIonKDH1t6j7rtiGlB7MqApulr8d7ad58a0';

  RequestInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers['Authorization'] = 'Bearer $staticToken';
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }
}

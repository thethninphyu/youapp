import 'package:youapp/services/baseapiservices.dart';
import 'package:youapp/services/baseurl.dart';
import 'package:youapp/services/networkapiservices.dart';
import 'package:youapp/util/app_logger.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.postApiResponse(AppBaseUrls.registerEndPoint, data);
      logger.e(response);

      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.postApiResponse(AppBaseUrls.loginEndPoint, data);
      logger.e(response);
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<dynamic> signOutUser() async {}
}

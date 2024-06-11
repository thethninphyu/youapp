import 'package:youapp/services/baseapiservices.dart';
import 'package:youapp/services/baseurl.dart';
import 'package:youapp/services/networkapiservices.dart';

class ProfileRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> createProfile(dynamic data) async {
    try {
      dynamic response = await apiServices.postApiResponse(
          AppBaseUrls.createProfileEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

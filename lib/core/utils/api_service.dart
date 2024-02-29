import 'package:dio/dio.dart';
import 'package:nectar/core/payment/stripe_keys.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Response> post(
      {required body,
      required String url,
      Map<String, dynamic>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: headers ??
                {'Authorization': "Bearer ${PaymentKeys.secretkey}"}));
    return response;
  }

  Future<Response> postCustomerId(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: headers ??
                {'Authorization': "Bearer ${PaymentKeys.secretkey}"}));
    return response;
  }
}

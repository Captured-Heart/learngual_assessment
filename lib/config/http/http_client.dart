import 'package:http/http.dart';

abstract class UserHttpClient {
  Future<Response> getRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool? withToken,
  });
  Future<Response> postRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool? withToken,
  });
}

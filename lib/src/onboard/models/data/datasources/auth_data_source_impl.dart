// ignore_for_file: prefer_const_declarations

import 'package:http/http.dart';
import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/config/api_urls.dart';

class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl({required this.httpClient});

  final UserHttpClient httpClient;

  @override
  Future<Response> signUpRequest(Map<String, dynamic> body) async {
    final url = '${ApiUrls.baseUrl}${ApiUrls.registerUrl}';
    var request = await httpClient.postRequest(url: url, body: body);
    return request;
  }

  @override
  Future<Response> signInRequest(Map<String, dynamic> body) async {
    final url = '${ApiUrls.baseUrl}${ApiUrls.loginUrl}';
    var request = await httpClient.postRequest(url: url, body: body);

    return request;
  }

  @override
  Future<Response> homeRequest() async {
    final url = '${ApiUrls.baseUrl}${ApiUrls.homeUrl}';
    log('home url: $url');
    var request = await httpClient.getRequest(url: url, withToken: true);

    return request;
  }
}

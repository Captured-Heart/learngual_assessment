// ignore_for_file: omit_local_variable_types

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:learngual_assessment/app.dart';

class UserHttpClientImpl implements UserHttpClient {
  const UserHttpClientImpl({required this.client});
  final http.Client client;

  @override
  Future<Response> getRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool? withToken,
  }) async {
    final Map<String, String> defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization':
            'Bearer ${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}',
      });
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: defaultHeaders,
      );
      return _handleRespose(response);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }

  Future<Response> _handleRespose(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // final jsonData = jsonDecode(response.body);
      try {
        return response;
      } catch (e) {
        throw ParsingJsonException();
      }
    } else {
      return Response(response.body, response.statusCode);
    }
    // throw ServerException();
  }

  @override
  Future<Response> postRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool? withToken,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        // ignore: use_if_null_to_convert_nulls_to_bools
        headers: withToken == true
            ? {
                'Authorization':
                    'Bearer ${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}',
                'Content-Type': 'application/x-www-form-urlencoded',
                'Connection': 'keep-alive',
                'Accept-Encoding': 'gzip, deflate, br',
              }
            : headers,
      );
      log('this url from http source: ${response.body}');

      return _handleRespose(response);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}

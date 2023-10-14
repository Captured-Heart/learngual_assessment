// ignore: one_member_abstracts
import 'package:http/http.dart';

abstract class AuthDataSource {
  Future<Response> signUpRequest(Map<String, dynamic> body);
  Future<Response> signInRequest(Map<String, dynamic> body);
  Future<Response> homeRequest();
}

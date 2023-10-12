// ignore_for_file: one_member_abstracts

import 'package:http/http.dart';
import 'package:learngual_assessment/app.dart';

abstract class AuthRepository {
  Future<Either<dynamic, Response>> signUp(Map<String, dynamic> body);
  Future<Either<dynamic, Response>> signIn(Map<String, dynamic> body);
  Future<Either<dynamic, Response>> home();


}

import 'package:http/http.dart';
import 'package:learngual_assessment/app.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.authDataSource);

  final AuthDataSource authDataSource;

  @override
  Future<Either<dynamic, Response>> signUp(Map<String, dynamic> body) async {
    if (await Connectivity.instance.isConnected()) {
      var signUpRes = await authDataSource.signUpRequest(body);
      if (signUpRes.statusCode >= 200 && signUpRes.statusCode <= 300) {
        return Right(signUpRes);
      } else {
        return Left(signUpRes);
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<dynamic, Response>> signIn(Map<String, dynamic> body) async {
    if (await Connectivity.instance.isConnected()) {
      var signInRes = await authDataSource.signInRequest(body);
      if (signInRes.statusCode >= 200 && signInRes.statusCode <= 300) {
        return Right(signInRes);
      } else {
        return Left(signInRes);
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<dynamic, Response>> home() async {
    if (await Connectivity.instance.isConnected()) {
      var homeRes = await authDataSource.homeRequest();
      if (homeRes.statusCode >= 200 && homeRes.statusCode <= 300) {
        return Right(homeRes);
      } else {
        return Left(homeRes);
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

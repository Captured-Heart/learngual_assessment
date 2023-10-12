import 'package:learngual_assessment/app.dart';

final authDataSourceProvider = Provider.family<AuthDataSource, UserHttpClient>((ref, httpClient) {
  return AuthDataSourceImpl(httpClient: httpClient);
});

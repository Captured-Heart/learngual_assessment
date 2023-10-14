import 'package:http/http.dart' as http;
import 'package:learngual_assessment/app.dart';

final httpClientProvider = Provider.autoDispose<UserHttpClient>((ref) {
  final client = http.Client();
  return UserHttpClientImpl(client: client);
});

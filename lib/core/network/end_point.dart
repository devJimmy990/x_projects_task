import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  /// using .env file to secure api key and server url
  /// call dotenv to restore the values as abstract constant
  /// for current state, the .env file not be available at remote repo,
  /// i`ll add base url manually, api key will be added later
  /// visit https://newsapi.org/ to create account and get api key
  static final String baseUrl =
      dotenv.env['SERVER_URL'] ?? "https://newsapi.org/v2/";
  static final String apiKey = dotenv.env['API_KEY']!;
  static const String everything = 'everything';
  static const String top = 'top-headlines';
}

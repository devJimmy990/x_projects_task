import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  /// using .env file to secure api key and server url
  /// call dotenv to restore the values as abstract constant
  static final String baseUrl = dotenv.env['SERVER_URL'] ?? "";
  static final String apiKey = dotenv.env['API_KEY'] ?? "";
  static const String news = 'everything';
}

import 'package:x_projects_task/core/network/end_point.dart';
import 'package:x_projects_task/core/network/dio_connection.dart';
import 'package:x_projects_task/features/home/data/data_source/base_news_data_source.dart';

class RemoteNewsDataSource implements BaseNewsDataSource {
  final DioConnection _connection;
  RemoteNewsDataSource() : _connection = DioConnection();

  @override
  Future<List<Map<String, dynamic>>> getNews({required int page}) async {
    try {
      final response = await _connection.get(
        EndPoint.top,
        params: {
          "page": 1,
          "country": "us",
          "sortBy": "publishedAt",
          "category": "technology",
          "pageSize": page * 35 > 100 ? 100 : page * 35,
        },
      );
      return List<Map<String, dynamic>>.from(response["articles"]);
    } catch (e) {
      rethrow;
    }
  }
}

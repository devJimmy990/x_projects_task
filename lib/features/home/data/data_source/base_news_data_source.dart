abstract class BaseNewsDataSource {
  Future<List<Map<String, dynamic>>> getNews({required int page});
}

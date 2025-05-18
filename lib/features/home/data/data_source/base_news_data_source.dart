abstract class BaseNewsDataSource {
  Future<List<Map<String, dynamic>>> getNews({required int page});
  Future<List<Map<String, dynamic>>> searchNews(
    String query, {
    required int page,
  });
}

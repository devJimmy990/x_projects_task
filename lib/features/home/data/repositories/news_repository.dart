import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/home/data/data_source/base_news_data_source.dart';

class NewsRepository {
  final BaseNewsDataSource _dataSource;
  NewsRepository(this._dataSource);

  Future<List<NewsItem>> getNews({required int page}) async {
    try {
      final data = await _dataSource.getNews(page: page);
      return data.isEmpty ? [] : data.map((e) => NewsItem.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

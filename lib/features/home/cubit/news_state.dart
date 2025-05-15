import 'package:x_projects_task/features/home/data/model/news_item.dart';

sealed class NewsState {}

class NewsInit extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsItem> news;
  late List<NewsItem> newest, latest;
  final bool isLoadingMore;

  NewsLoaded({required this.news, this.isLoadingMore = false})
    : newest = List.unmodifiable(
        news
            .where(
              (item) =>
                  DateTime.now().difference(item.publishedAt).inHours <= 48,
            )
            .toList(),
      ),
      latest = List.unmodifiable(
        news
            .where(
              (item) =>
                  DateTime.now().difference(item.publishedAt).inHours > 48,
            )
            .toList(),
      );
}

class NewsError extends NewsState {
  final String error;
  NewsError(this.error);
}

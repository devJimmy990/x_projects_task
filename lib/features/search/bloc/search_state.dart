import 'package:equatable/equatable.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => [];
}

class SearchInit extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<NewsItem> news;
  final bool isLoadingMore;

  const SearchLoaded({required this.news, this.isLoadingMore = false});

  SearchLoaded copyWith({List<NewsItem>? news, bool? isLoadingMore}) {
    return SearchLoaded(
      news: news ?? this.news,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [news, isLoadingMore];
}

class SearchError extends SearchState {
  final String error;
  const SearchError(this.error);

  @override
  List<Object?> get props => [error];
}

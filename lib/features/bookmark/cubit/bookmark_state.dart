import 'package:equatable/equatable.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';

sealed class BookmarkState {}

class BookmarkInit extends BookmarkState {}

class BookmarkUpdated extends BookmarkState with EquatableMixin {
  final String? action;
  final List<NewsItem> bookmarks;

  BookmarkUpdated(this.bookmarks, {this.action});

  @override
  List<Object?> get props => [action, bookmarks];
}

class BookmarkError extends BookmarkState {
  final String error;
  BookmarkError(this.error);
}

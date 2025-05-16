import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_projects_task/features/bookmark/cubit/bookmark_state.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';

class BookmarkCubit extends HydratedCubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInit());

  void addBookmark(NewsItem newsItem) {
    try {
      if (state is! BookmarkUpdated) {
        emit(BookmarkUpdated([newsItem], action: "add"));
      } else {
        final currentState = state as BookmarkUpdated;
        final updatedList = List<NewsItem>.from(currentState.bookmarks)
          ..add(newsItem);
        emit(BookmarkUpdated(updatedList, action: "add"));
      }
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  void removeBookmark(String id) {
    try {
      if (state is! BookmarkUpdated) return;

      final currentState = state as BookmarkUpdated;
      final updatedList = List<NewsItem>.from(currentState.bookmarks)
        ..removeWhere((e) => e.id == id);

      emit(BookmarkUpdated(updatedList, action: "remove"));
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  void removeAt(int idx) {
    try {
      if (state is! BookmarkUpdated) return;

      final currentState = state as BookmarkUpdated;
      final updatedList = List<NewsItem>.from(currentState.bookmarks)
        ..removeAt(idx);

      emit(BookmarkUpdated(updatedList, action: "remove"));
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  bool isBookmarked(String id) =>
      state is BookmarkUpdated &&
      (state as BookmarkUpdated).bookmarks.isNotEmpty &&
      (state as BookmarkUpdated).bookmarks.any((e) => e.id == id);
  @override
  BookmarkState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey("bookmarks")) {
      final bookmarks =
          (json["bookmarks"] as List).map((e) => NewsItem.fromJson(e)).toList();
      return BookmarkUpdated(bookmarks);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(BookmarkState state) {
    if (state is BookmarkUpdated) {
      return {"bookmarks": state.bookmarks.map((e) => e.toMap()).toList()};
    }
    return null;
  }
}

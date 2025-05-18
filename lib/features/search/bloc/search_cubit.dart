import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_projects_task/features/search/bloc/search_state.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/home/data/repositories/news_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final NewsRepository _repository;

  int _page = 1;
  bool _isLoadingMore = false;
  List<NewsItem> _news = [];
  Timer? _debounce;
  String _query = '';
  static const int maxPage = 5;

  SearchCubit(this._repository) : super(SearchInit());

  void onQueryChanged(String query) {
    _query = query.trim();
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_query.isEmpty) {
        _news = [];
        _page = 1;
        emit(SearchInit());
        return;
      }
      _page = 1;
      _news = [];
      _searchNews();
    });
  }

  void _searchNews() async {
    emit(SearchLoading());
    try {
      final results = await _repository.searchNews(query: _query, page: _page);
      _news = results;
      emit(SearchLoaded(news: _news, isLoadingMore: false));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void loadMoreNews() async {
    if (_isLoadingMore || _page >= maxPage || _query.isEmpty) return;
    if (state is! SearchLoaded) return;

    _isLoadingMore = true;
    emit(SearchLoaded(news: _news, isLoadingMore: true));

    try {
      final newItems = await _repository.searchNews(
        query: _query,
        page: ++_page,
      );
      _news.addAll(newItems);
      emit(SearchLoaded(news: _news, isLoadingMore: false));
    } catch (e) {
      _page--; // Revert page increment on error
      emit(SearchError(e.toString()));
    } finally {
      _isLoadingMore = false;
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

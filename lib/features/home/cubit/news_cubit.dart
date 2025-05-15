import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_projects_task/features/home/cubit/news_state.dart';
import 'package:x_projects_task/features/home/data/model/news_item.dart';
import 'package:x_projects_task/features/home/data/repositories/news_repository.dart';

class NewsCubit extends Cubit<NewsState> {
  int _page = 1;
  bool _isLoadingMore = false;
  List<NewsItem> _news = [];
  final NewsRepository _repository;

  NewsCubit(this._repository) : super(NewsInit()) {
    getNews();
  }

  void getNews() async {
    emit(NewsLoading());
    try {
      _news = await _repository.getNews(page: _page);
      emit(NewsLoaded(news: _news, isLoadingMore: false));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void loadMoreNews() async {
    if (_isLoadingMore || _page == 4) return;
    _isLoadingMore = true;

    if (state is NewsLoaded) {
      emit(NewsLoaded(news: _news, isLoadingMore: true));
    }

    try {
      final newItems = await _repository.getNews(page: ++_page);
      _news.addAll(newItems);
      emit(NewsLoaded(news: _news, isLoadingMore: false));
    } catch (e) {
      emit(NewsError(e.toString()));
    }

    _isLoadingMore = false;
  }
}

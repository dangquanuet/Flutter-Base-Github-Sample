import 'package:app/data/model/movie.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/movie_repo.dart';
import 'package:app/ui/component/loading_state_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO change to generic

final movieListViewModelProvider =
    ChangeNotifierProvider((ref) => MovieListViewModel(ref.read));

class MovieListViewModel extends ChangeNotifier {
  MovieListViewModel(this._reader);

  final Reader _reader;
  late final MovieRepo _repo = _reader(movieRepoProvider);
  late final _loadingProvider = _reader(loadingStateProvider);
  List<Movie> _itemList = [];
  bool isFirstLoad = true;
  bool isLoading = false;
  bool isLoadSuccess = false;
  bool isLoadError = false;
  bool _isLastPage = false;
  late int _currentPage = _getPreFirstPage();
  static const int pageSize = 20;
  static const int firstPage = 1;

  List<Movie> get itemList => _itemList;

  int _getFirstPage() {
    return firstPage;
  }

  int _getPreFirstPage() {
    return _getFirstPage() - 1;
  }

  int _getPageSize() {
    return pageSize;
  }

  // need to rewrite for each page
  Future<Result<List<Movie>>> callApi({
    required int page,
  }) async {
    return _repo.getPopularMovieList(page: page);
  }

  // get item list
  Future<void> loadPage({
    required int page,
  }) async {
    isLoadSuccess = false;
    isLoadError = false;
    isLoading = true;
    final result = await callApi(page: page);
    result.when(
      success: (data) {
        onLoadSuccess(page: page, items: data);
      },
      failure: (e) {
        onError();
      },
    );
  }

  Future<void> firstLoad() async {
    if (isFirstLoad && _currentPage == _getPreFirstPage() && itemList.isEmpty) {
      isFirstLoad = false;
      loadPage(page: _getFirstPage());
    }
  }

  Future<void> refresh() async {
    _loadingProvider.toLoading();
    loadPage(page: _getFirstPage());
    _loadingProvider.toIdle();
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isLoading || _isLastPage) {
      return;
    }
    loadPage(page: _currentPage + 1);
    notifyListeners();
  }

  Future<void> onLoadSuccess({
    required int page,
    required List<Movie> items,
  }) async {
    _currentPage = page;
    if (_currentPage == _getFirstPage()) _itemList.clear();
    isLoading = false;
    isLoadSuccess = true;
    isLoadError = false;
    _itemList = [..._itemList, ...items];
    _isLastPage = items.length < _getPageSize();
    notifyListeners();
  }

  Future<void> onError() async {
    isLoading = false;
    isLoadSuccess = false;
    isLoadError = true;
    notifyListeners();
  }
}

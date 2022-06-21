import 'package:app/data/model/result.dart';
import 'package:app/data/provider/error_provider.dart';
import 'package:app/data/remote/api/movie_api.dart';
import 'package:app/data/remote/response/movie_list_response.dart';
import 'package:app/data/repository/movie_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieRepoImpl implements MovieRepo {
  MovieRepoImpl(this._reader);

  final Reader _reader;

  late final MovieApi _movieApi = _reader(movieApiProvider);
  late final _errorNotifier = _reader(errorProvider);

  @override
  Future<Result<MovieListResponse>> getPopularMovieList(int page) {
    return Result.guardFuture(
        () async => await _movieApi.getMovieList(page: page), _errorNotifier);
  }
}

import 'package:app/data/model/movie.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/provider/error_provider.dart';
import 'package:app/data/remote/api/movie_api.dart';
import 'package:app/data/repository/movie_repo.dart';
import 'package:app/foundation/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieRepoImpl implements MovieRepo {
  MovieRepoImpl(this._ref);

  final Ref _ref;

  late final MovieApi _movieApi = _ref.read(movieApiProvider);
  late final _errorNotifier = _ref.read(errorProvider);

  @override
  Future<Result<List<Movie>>> getPopularMovieList({
    required int page,
  }) {
    return Result.guardFuture(
      () async => await _movieApi.getMovieList(
        {
          'api_key': Constants.of().apiKey,
          'sort_by': 'popularity.desc',
          'page': page,
        },
      ).then((value) => value.results ?? <Movie>[]),
      _errorNotifier,
    );
  }
}

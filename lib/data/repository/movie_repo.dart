import 'package:app/data/model/movie.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/impl/movie_repo_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieRepoProvider = Provider<MovieRepo>((ref) => MovieRepoImpl(ref.read));

abstract class MovieRepo {
  Future<Result<List<Movie>>> getPopularMovieList({required int page});
}

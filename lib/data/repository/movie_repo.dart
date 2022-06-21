import 'package:app/data/model/result.dart';
import 'package:app/data/remote/response/movie_list_response.dart';

abstract class MovieRepo {
  Future<Result<MovieListResponse>> getPopularMovieList(int page);
}

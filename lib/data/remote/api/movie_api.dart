import 'package:app/data/model/movie.dart';
import 'package:app/data/remote/api/app_dio.dart';
import 'package:app/data/remote/response/movie_list_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

final movieApiProvider = Provider((ref) => MovieApi(ref.read));

@RestApi()
abstract class MovieApi {
  factory MovieApi(Reader reader) => _MovieApi(reader(dioProvider));

  @GET('3/discover/movie')
  Future<MovieListResponse> getMovieList({
    @Query('page') required int page,
  });

  @GET('3/movie/{movie_id}')
  Future<Movie> getMovie({@Path('movie_id') required String movieId});
}

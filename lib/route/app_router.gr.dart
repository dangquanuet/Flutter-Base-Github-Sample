// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<HomePage>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MovieListRoute.name: (routeData) {
      return MaterialPageX<MovieListPage>(
        routeData: routeData,
        child: const MovieListPage(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return MaterialPageX<MovieDetailPage>(
        routeData: routeData,
        child: MovieDetailPage(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return MaterialPageX<DetailPage>(
        routeData: routeData,
        child: DetailPage(
          key: args.key,
          repos: args.repos,
        ),
      );
    },
    LanguageRoute.name: (routeData) {
      return MaterialPageX<LanguagePage>(
        routeData: routeData,
        child: const LanguagePage(),
      );
    },
    TestRoute.name: (routeData) {
      return MaterialPageX<TestPage>(
        routeData: routeData,
        child: const TestPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/testPage',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          MovieListRoute.name,
          path: '/movielist',
        ),
        RouteConfig(
          MovieDetailRoute.name,
          path: '/moviedetail',
        ),
        RouteConfig(
          DetailRoute.name,
          path: '/detail',
        ),
        RouteConfig(
          LanguageRoute.name,
          path: '/language',
        ),
        RouteConfig(
          TestRoute.name,
          path: '/testPage',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [MovieListPage]
class MovieListRoute extends PageRouteInfo<void> {
  const MovieListRoute()
      : super(
          MovieListRoute.name,
          path: '/movielist',
        );

  static const String name = 'MovieListRoute';
}

/// generated route for
/// [MovieDetailPage]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    Key? key,
    required Movie movie,
  }) : super(
          MovieDetailRoute.name,
          path: '/moviedetail',
          args: MovieDetailRouteArgs(
            key: key,
            movie: movie,
          ),
        );

  static const String name = 'MovieDetailRoute';
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movie,
  });

  final Key? key;

  final Movie movie;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    required Repos repos,
  }) : super(
          DetailRoute.name,
          path: '/detail',
          args: DetailRouteArgs(
            key: key,
            repos: repos,
          ),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.repos,
  });

  final Key? key;

  final Repos repos;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, repos: $repos}';
  }
}

/// generated route for
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute()
      : super(
          LanguageRoute.name,
          path: '/language',
        );

  static const String name = 'LanguageRoute';
}

/// generated route for
/// [TestPage]
class TestRoute extends PageRouteInfo<void> {
  const TestRoute()
      : super(
          TestRoute.name,
          path: '/testPage',
        );

  static const String name = 'TestRoute';
}

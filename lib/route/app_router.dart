import 'package:app/data/model/movie.dart';
import 'package:app/data/model/repos.dart';
import 'package:app/ui/detail/detail_page.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:app/ui/language/language_page.dart';
import 'package:app/ui/moviedetail/movie_detail_page.dart';
import 'package:app/ui/movielist/movie_list_page.dart';
import 'package:app/ui/test_page/test_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider((_) => AppRouter());

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<HomePage>(
      path: '/home',
      page: HomePage,
      // initial: true,
    ),
    AutoRoute<MovieListPage>(
      path: '/movielist',
      page: MovieListPage,
    ),
    AutoRoute<MovieDetailPage>(
      path: '/moviedetail',
      page: MovieDetailPage,
    ),
    AutoRoute<DetailPage>(
      path: '/detail',
      page: DetailPage,
    ),
    AutoRoute<LanguagePage>(
      path: '/language',
      page: LanguagePage,
    ),
    AutoRoute<TestPage>(
      path: "/testPage",
      page: TestPage,
      initial: true,
    )
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}

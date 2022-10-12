import 'package:app/data/model/repos.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/provider/error_provider.dart';
import 'package:app/data/remote/api/github_data_source.dart';
import 'package:app/data/repository/github_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepoImpl implements GithubRepo {
  GithubRepoImpl(this._ref);

  final Ref _ref;

  late final GithubDataSource _dataSource = _ref.read(githubDataSourceProvider);
  late final _errorNotifier = _ref.read(errorProvider);

  @override
  Future<Result<User>> getUser(String userId) {
    return Result.guardFuture(
        () async => await _dataSource.getUser(id: userId), _errorNotifier);
  }

  @override
  Future<Result<List<Repos>>> getRepos(String userId, int page,
      [int perPage = 25]) {
    return Result.guardFuture(
        () async => await _dataSource.getRepos(
            id: userId, page: page, perPage: perPage),
        _errorNotifier);
  }
}

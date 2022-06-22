import 'package:app/data/model/repos.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/repository/impl/github_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubRepoProvider = Provider<GithubRepo>((ref) => GithubRepoImpl(ref.read));

abstract class GithubRepo {
  Future<Result<User>> getUser(String id);

  Future<Result<List<Repos>>> getRepos(String id, int page, int perPage);
}

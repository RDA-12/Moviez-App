import 'package:moviez_app/data/datasources/local/shared_pref.dart';

import '../../domain/entity/user.dart';
import '../../domain/repositories/user_repo.dart';
import '../datasources/remotes/users.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource dataSource;
  final LocalDatasource localDatasource;
  UserRepoImpl({required this.dataSource, required this.localDatasource});

  @override
  Future<void> deleteUser() async {
    await dataSource.deleteUser();
    await localDatasource.clear();
  }

  @override
  Future<User> getUser() async {
    return await dataSource.getUser();
  }

  @override
  Future<void> updateUser({
    String? username,
    Map<String, dynamic>? image,
    String? email,
    String? password,
  }) async {
    await dataSource.updateUser(
      email: email,
      username: username,
      password: password,
      image: image,
    );
  }
}

import '../../domain/entity/user.dart';
import '../../domain/repositories/user_repo.dart';
import '../datasources/remotes/users.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource dataSource;
  UserRepoImpl(this.dataSource);

  @override
  Future<void> deleteUser() async {
    await dataSource.deleteUser();
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

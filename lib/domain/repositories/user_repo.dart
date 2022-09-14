import '../entity/user.dart';

abstract class UserRepo {
  Future<User> getUser();
  Future<void> updateUser({
    String? username,
    Map<String, dynamic>? image,
    String? email,
    String? password,
  });
  Future<void> deleteUser();
}

abstract class AuthRepo {
  bool loginCheck();
  Future<void> login({required String email, required String password});
  Future<void> logout();
  Future<void> register({required String email, required String password});
}

import 'package:firebase_auth/firebase_auth.dart';

import '../../core/resources/strings.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/local/shared_pref.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth firebaseAuth;
  final LocalDatasource localDatasource;
  AuthRepoImpl({
    required this.firebaseAuth,
    required this.localDatasource,
  });

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await localDatasource.setLogin();
    } on FirebaseAuthException catch (e) {
      if ((e.code == 'user-not-found') || (e.code == 'wrong-password')) {
        throw kInvalidCredentials;
      }
    } on Exception {
      throw kUnexpectedError;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      await localDatasource.clear();
    } catch (e) {
      throw kUnexpectedError;
    }
  }

  @override
  Future<void> register(
      {required String email, required String password}) async {
    try {
      final UserCredential userCred =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCred.user!;
      await user.updateDisplayName("user${user.uid.substring(0, 4)}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw kEmailAlreadyInUse;
      }
    } on Exception {
      throw kUnexpectedError;
    }
  }

  @override
  bool loginCheck() {
    return localDatasource.checkUser();
  }
}

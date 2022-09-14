import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entity/user.dart' as local;

class UserModel extends local.User {
  const UserModel({
    required super.email,
    required super.profileImgUrl,
    required super.username,
  });

  factory UserModel.fromFirebase(User firebaseUser) {
    return UserModel(
      email: firebaseUser.email!,
      profileImgUrl: firebaseUser.photoURL ?? "",
      username: firebaseUser.displayName ?? "",
    );
  }
}

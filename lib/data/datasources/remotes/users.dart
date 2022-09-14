import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../../../core/resources/strings.dart';
import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
  Future<void> updateUser({
    String? email,
    Map<String, dynamic>? image,
    String? username,
    String? password,
  });
  Future<void> deleteUser();
}

class FirebaseUser implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  FirebaseUser({
    required this.firebaseAuth,
    required this.firebaseStorage,
  });

  @override
  Future<void> deleteUser() async {
    try {
      await firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        throw kReLoginPlease;
      } else {
        throw kServerError;
      }
    } catch (e) {
      throw kUnexpectedError;
    }
  }

  @override
  Future<UserModel> getUser() async {
    final User firebaseUser = FirebaseAuth.instance.currentUser!;
    if (firebaseUser.displayName == null) {
      await firebaseUser
          .updateDisplayName("User${firebaseUser.uid.substring(0, 2)}");
    }
    return UserModel.fromFirebase(firebaseUser);
  }

  @override
  Future<void> updateUser({
    String? email,
    Map<String, dynamic>? image,
    String? username,
    String? password,
  }) async {
    final User firebaseUser = FirebaseAuth.instance.currentUser!;
    try {
      if (email != null) await firebaseUser.updateEmail(email);
      if (image != null) {
        final String fileName = image["fileName"];
        final Uint8List imageBytes = image["imageBytes"];
        final Reference storageRef = firebaseStorage.ref();
        final Reference profileRef =
            storageRef.child("users/${firebaseUser.uid}/$fileName");
        await profileRef.putData(imageBytes);
        final String profileImg = await profileRef.getDownloadURL();
        await firebaseUser.updatePhotoURL(profileImg);
      }
      if (username != null) await firebaseUser.updateDisplayName(username);
      if (password != null) await firebaseUser.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw kEmailAlreadyInUse;
      } else if (e.code == "requires-recent-login") {
        throw kReLoginPlease;
      } else {
        throw kServerError;
      }
    } catch (e) {
      throw kUnexpectedError;
    }
  }
}

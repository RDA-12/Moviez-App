import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/resources/strings.dart';
import '../../models/movie_model.dart';

abstract class FavoriteMoviesDataSource {
  Future<List<MovieModel>> getAllFavoriteMovies();
  Future<void> addFavoriteMovie(MovieModel movie);
  Future<void> deleteFavoriteMovie(MovieModel movie);
}

class FirestoreFavorite implements FavoriteMoviesDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  FirestoreFavorite({
    required this.firestore,
    required this.firebaseAuth,
  });

  @override
  Future<void> addFavoriteMovie(MovieModel movie) async {
    final User user = firebaseAuth.currentUser!;
    try {
      await firestore
          .collection("users")
          .doc(user.uid)
          .collection("favoriteMovies")
          .doc(movie.id)
          .set(movie.toJson());
    } catch (e) {
      throw kServerError;
    }
  }

  @override
  Future<void> deleteFavoriteMovie(MovieModel movie) async {
    final User user = firebaseAuth.currentUser!;
    try {
      await firestore
          .collection("users")
          .doc(user.uid)
          .collection("favoriteMovies")
          .doc(movie.id)
          .delete();
    } catch (e) {
      throw kServerError;
    }
  }

  @override
  Future<List<MovieModel>> getAllFavoriteMovies() async {
    final User user = firebaseAuth.currentUser!;
    List<MovieModel> movies = [];
    await firestore
        .collection("users")
        .doc(user.uid)
        .collection("favoriteMovies")
        .get()
        .then(
      (res) {
        for (final doc in res.docs) {
          movies.add(MovieModel.fromJson(doc.data()));
        }
      },
      onError: (err) {
        throw kServerError;
      },
    );
    return movies;
  }
}

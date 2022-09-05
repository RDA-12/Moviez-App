import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/resources/strings.dart';
import '../../models/movie_model.dart';

abstract class WatchlistMoviesDataSource {
  Future<List<MovieModel>> getAllWatchlistMovies();
  Future<void> addWatchlistMovie(MovieModel movie);
  Future<void> deleteWatchlistMovie(MovieModel movie);
}

class FirestoreWatchlist implements WatchlistMoviesDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  FirestoreWatchlist({
    required this.firestore,
    required this.firebaseAuth,
  });

  @override
  Future<void> addWatchlistMovie(MovieModel movie) async {
    final User user = firebaseAuth.currentUser!;
    try {
      await firestore
          .collection("users")
          .doc(user.uid)
          .collection("watchlistMovies")
          .doc(movie.id)
          .set(movie.toJson());
    } catch (e) {
      throw kServerError;
    }
  }

  @override
  Future<void> deleteWatchlistMovie(MovieModel movie) async {
    final User user = firebaseAuth.currentUser!;
    try {
      await firestore
          .collection("users")
          .doc(user.uid)
          .collection("watchlistMovies")
          .doc(movie.id)
          .delete();
    } catch (e) {
      throw kServerError;
    }
  }

  @override
  Future<List<MovieModel>> getAllWatchlistMovies() async {
    final User user = firebaseAuth.currentUser!;
    List<MovieModel> movies = [];
    await firestore
        .collection("users")
        .doc(user.uid)
        .collection("watchlistMovies")
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

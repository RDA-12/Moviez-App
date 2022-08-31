import 'package:dio/dio.dart';

import '../../../core/error_handler/remote_error_handler.dart';
import '../../../core/resources/urls.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';

abstract class RemoteMoviesDataSource {
  Future<List<MovieModel>> getTopMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getInTheatersMovies();
  Future<List<MovieModel>> getBoxOfficeMovies();
  Future<MovieDetailModel> getMovieDetail(String movieId);
}

class ImdbAPI implements RemoteMoviesDataSource {
  final Dio dio;
  ImdbAPI(this.dio);

  @override
  Future<List<MovieModel>> getBoxOfficeMovies() async {
    try {
      final Response response = await dio.get(urls.getBoxOfficeMoviesUrl());
      List<MovieModel> movies = [];
      for (var data in response.data["items"]) {
        movies.add(MovieModel.fromJson(data));
      }
      return movies;
    } on Exception catch (e) {
      throw remoteErrorHandler(e);
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(String movieId) async {
    try {
      final Response movieResponse = await dio.get(
        urls.getMovieDetailUrl(movieId),
      );
      final Response trailerResponse = await dio.get(
        urls.getMovieTrailerUrl(movieId),
      );
      final MovieDetailModel movie = MovieDetailModel.fromJson(
        json: movieResponse.data,
        youtubeId: trailerResponse.data["videoId"],
      );
      return movie;
    } on Exception catch (e) {
      throw remoteErrorHandler(e);
    }
  }

  @override
  Future<List<MovieModel>> getInTheatersMovies() async {
    try {
      final Response response = await dio.get(urls.getInTheaterMoviesUrl());
      List<MovieModel> movies = [];
      for (var data in response.data["items"]) {
        movies.add(MovieModel.fromJson(data));
      }
      return movies;
    } on Exception catch (e) {
      throw remoteErrorHandler(e);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final Response response = await dio.get(urls.getPopularMoviesUrl());
      List<MovieModel> movies = [];
      for (var data in response.data["items"]) {
        movies.add(MovieModel.fromJson(data));
      }
      return movies;
    } on Exception catch (e) {
      throw remoteErrorHandler(e);
    }
  }

  @override
  Future<List<MovieModel>> getTopMovies() async {
    try {
      final Response response = await dio.get(urls.getTopMoviesUrl());
      List<MovieModel> movies = [];
      for (var data in response.data["items"]) {
        movies.add(MovieModel.fromJson(data));
      }
      return movies;
    } on Exception catch (e) {
      throw remoteErrorHandler(e);
    }
  }
}

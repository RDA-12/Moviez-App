import 'package:dio/dio.dart';

import '../../../core/error_handler/remote_error_handler.dart';
import '../../../core/resources/urls.dart';
import '../../models/movie_model.dart';

abstract class RemoteMoviesDataSource {
  Future<List<MovieModel>> getTopMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getInTheatersMovies();
  Future<List<MovieModel>> getBoxOfficeMovies();
  Future<MovieModel> getMovieDetail(String movieId);
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
  Future<MovieModel> getMovieDetail(String movieId) async {
    // // TODO: implement getMovieDetail
    // throw UnimplementedError();
    return const MovieModel(
      id: "id",
      image: "image",
    );
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

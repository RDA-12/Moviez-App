import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/local/shared_pref.dart';
import 'data/datasources/remotes/favorite_movies.dart';
import 'data/datasources/remotes/movies.dart';
import 'data/datasources/remotes/watchlist_movies.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'data/repositories/favorite_movies_repo_impl.dart';
import 'data/repositories/movie_repo_impl.dart';
import 'data/repositories/watchlist_movies_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/repositories/favorite_movies_repo.dart';
import 'domain/repositories/movies_repo.dart';
import 'domain/repositories/watchlist_movies_repo.dart';
import 'domain/usecases/auth/login_check_usecase.dart';
import 'domain/usecases/auth/login_usecase.dart';
import 'domain/usecases/auth/logout_usecase.dart';
import 'domain/usecases/auth/register_usecase.dart';
import 'domain/usecases/favorite_movies/add_favorite_movie_usecase.dart';
import 'domain/usecases/favorite_movies/delete_favorite_movie_usecase.dart';
import 'domain/usecases/favorite_movies/get_all_favorite_movies_usecase.dart';
import 'domain/usecases/movies/get_box_office_movies_usecase.dart';
import 'domain/usecases/movies/get_in_theater_movies_usecase.dart';
import 'domain/usecases/movies/get_movie_detail_usecase.dart';
import 'domain/usecases/movies/get_popular_movies_usecase.dart';
import 'domain/usecases/movies/get_top_movies_usecase.dart';
import 'domain/usecases/watchlist_movies/add_watchlist_movie_usecase.dart';
import 'domain/usecases/watchlist_movies/delete_watchlist_movie_usecase.dart';
import 'domain/usecases/watchlist_movies/get_all_watchlist_movies_usecase.dart';
import 'presentation/bloc/bloc.dart';
import 'presentation/routes/routes.gr.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      logOutUseCase: getIt(),
      loginCheckUseCase: getIt(),
    ),
  );
  getIt.registerFactory<TopMoviesBloc>(() => TopMoviesBloc(getIt()));
  getIt.registerFactory<PopularMoviesBloc>(() => PopularMoviesBloc(getIt()));
  getIt
      .registerFactory<InTheaterMoviesBloc>(() => InTheaterMoviesBloc(getIt()));
  getIt
      .registerFactory<BoxOfficeMoviesBloc>(() => BoxOfficeMoviesBloc(getIt()));
  getIt.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(getIt()));
  getIt.registerFactory<FavoriteMoviesBloc>(
    () => FavoriteMoviesBloc(
      getAllFavoriteMoviesUseCase: getIt(),
      addFavoriteMovieUseCase: getIt(),
      deleteFavoriteMovieUseCase: getIt(),
    ),
  );
  getIt.registerFactory<WatchlistMoviesBloc>(
    () => WatchlistMoviesBloc(
      getAllWatchlistMoviesUseCase: getIt(),
      addWatchlistMovieUseCase: getIt(),
      deleteWatchlistMovieUseCase: getIt(),
    ),
  );

  // Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firebaseAuth: getIt(),
      localDatasource: getIt(),
    ),
  );
  getIt.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<FavoriteMoviesRepo>(
    () => FavoriteMoviesRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<WatchlistMoviesRepo>(
    () => WatchlistMoviesRepoImpl(getIt()),
  );

  // datasource
  getIt.registerLazySingleton<RemoteMoviesDataSource>(
    () => ImdbAPIDataSource(getIt()),
  );
  getIt.registerLazySingleton<LocalDatasource>(
    () => SharedPrefDatasource(getIt()),
  );
  getIt.registerLazySingleton<FavoriteMoviesDataSource>(
    () => FirestoreFavorite(firestore: getIt(), firebaseAuth: getIt()),
  );
  getIt.registerLazySingleton<WatchlistMoviesDataSource>(
    () => FirestoreWatchlist(firestore: getIt(), firebaseAuth: getIt()),
  );

  // external
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPref);
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerLazySingleton<Dio>(() => Dio());

  // usecases
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton<LoginCheckUseCase>(
      () => LoginCheckUseCase(getIt()));
  getIt.registerLazySingleton<GetTopMoviesUseCase>(
    () => GetTopMoviesUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetInTheaterMoviesUseCase>(
    () => GetInTheaterMoviesUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBoxOfficeMoviesUseCase>(
    () => GetBoxOfficeMoviesUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetMovieDetailUseCase>(
    () => GetMovieDetailUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetAllFavoriteMoviesUseCase>(
    () => GetAllFavoriteMoviesUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddFavoriteMovieUseCase>(
    () => AddFavoriteMovieUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteFavoriteMovieUseCase>(
    () => DeleteFavoriteMovieUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetAllWatchlistMoviesUseCase>(
    () => GetAllWatchlistMoviesUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddWatchlistMovieUseCase>(
    () => AddWatchlistMovieUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteWatchlistMovieUseCase>(
    () => DeleteWatchlistMovieUseCase(getIt()),
  );
}

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/local/shared_pref.dart';
import 'data/datasources/remotes/movies.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'data/repositories/movie_repo_impl.dart';
import 'domain/usecases/auth/login_check_usecase.dart';
import 'domain/usecases/auth/login_usecase.dart';
import 'domain/usecases/auth/logout_usecase.dart';
import 'domain/usecases/auth/register_usecase.dart';
import 'domain/usecases/movies/get_box_office_movies_usecase.dart';
import 'domain/usecases/movies/get_in_theater_movies_usecase.dart';
import 'domain/usecases/movies/get_popular_movies_usecase.dart';
import 'domain/usecases/movies/get_top_movies_usecase.dart';
import 'firebase_options.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/box_office_movies/box_office_movies_bloc.dart';
import 'presentation/bloc/in_theater_movies/in_theater_movies_bloc.dart';
import 'presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'presentation/bloc/top_movies/top_movies_bloc.dart';
import 'presentation/routes/routes.gr.dart';
import 'presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter appRouter;

  late final LoginUseCase loginUseCase;
  late final LogOutUseCase logOutUseCase;
  late final RegisterUseCase registerUseCase;
  late final LoginCheckUseCase loginCheckUseCase;
  late final GetTopMoviesUseCase getTopMoviesUseCase;
  late final GetPopularMoviesUseCase getPopularMoviesUseCase;
  late final GetInTheaterMoviesUseCase getInTheaterMoviesUseCase;
  late final GetBoxOfficeMoviesUseCase getBoxOfficeMoviesUseCase;

  late final AuthRepoImpl authRepo;
  late final MovieRepoImpl movieRepo;

  late final ImdbAPI imdbAPI;
  late final SharedPrefDatasource sharedPrefDatasource;

  late final AuthBloc authBloc;
  late final TopMoviesBloc topMoviesBloc;
  late final PopularMoviesBloc popularMoviesBloc;
  late final InTheaterMoviesBloc inTheaterMoviesBloc;
  late final BoxOfficeMoviesBloc boxOfficeMoviesBloc;

  late final SharedPreferences sharedPreferences;
  late final FirebaseAuth firebaseAuth;
  late final Dio dio;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
    firebaseAuth = FirebaseAuth.instance;
    sharedPreferences = widget.sharedPreferences;
    dio = Dio();
    sharedPrefDatasource = SharedPrefDatasource(sharedPreferences);
    imdbAPI = ImdbAPI(dio);
    authRepo = AuthRepoImpl(
      firebaseAuth: firebaseAuth,
      localDatasource: sharedPrefDatasource,
    );
    movieRepo = MovieRepoImpl(imdbAPI);
    loginUseCase = LoginUseCase(authRepo);
    logOutUseCase = LogOutUseCase(authRepo);
    registerUseCase = RegisterUseCase(authRepo);
    loginCheckUseCase = LoginCheckUseCase(authRepo);
    getTopMoviesUseCase = GetTopMoviesUseCase(movieRepo);
    getPopularMoviesUseCase = GetPopularMoviesUseCase(movieRepo);
    getInTheaterMoviesUseCase = GetInTheaterMoviesUseCase(movieRepo);
    getBoxOfficeMoviesUseCase = GetBoxOfficeMoviesUseCase(movieRepo);
    authBloc = AuthBloc(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
      logOutUseCase: logOutUseCase,
      loginCheckUseCase: loginCheckUseCase,
    );
    topMoviesBloc = TopMoviesBloc(getTopMoviesUseCase);
    popularMoviesBloc = PopularMoviesBloc(getPopularMoviesUseCase);
    inTheaterMoviesBloc = InTheaterMoviesBloc(getInTheaterMoviesUseCase);
    boxOfficeMoviesBloc = BoxOfficeMoviesBloc(getBoxOfficeMoviesUseCase);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authBloc),
        BlocProvider(create: (_) => topMoviesBloc),
        BlocProvider(create: (_) => popularMoviesBloc),
        BlocProvider(create: (_) => inTheaterMoviesBloc),
        BlocProvider(create: (_) => boxOfficeMoviesBloc),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light(),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'injection.dart' as di;
import 'presentation/bloc/bloc.dart';
import 'presentation/routes/routes.gr.dart';
import 'presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<AuthBloc>()),
        BlocProvider(create: (_) => di.getIt<TopMoviesBloc>()),
        BlocProvider(create: (_) => di.getIt<PopularMoviesBloc>()),
        BlocProvider(create: (_) => di.getIt<InTheaterMoviesBloc>()),
        BlocProvider(create: (_) => di.getIt<BoxOfficeMoviesBloc>()),
        BlocProvider(create: (_) => di.getIt<MovieDetailBloc>()),
        BlocProvider(create: (_) => di.getIt<FavoriteMoviesBloc>()),
        BlocProvider(create: (_) => di.getIt<WatchlistMoviesBloc>()),
        BlocProvider(create: (_) => di.getIt<NewsBloc>()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light(),
        routerDelegate: di.getIt<AppRouter>().delegate(),
        routeInformationParser: di.getIt<AppRouter>().defaultRouteParser(),
      ),
    );
  }
}

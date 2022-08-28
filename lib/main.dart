import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/local/shared_pref.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/usecases/auth/login_check_usecase.dart';
import 'domain/usecases/auth/login_usecase.dart';
import 'domain/usecases/auth/logout_usecase.dart';
import 'domain/usecases/auth/register_usecase.dart';
import 'firebase_options.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
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

  late final AuthRepoImpl authRepo;
  late final SharedPrefDatasource sharedPrefDatasource;

  late final AuthBloc authBloc;

  late final SharedPreferences sharedPreferences;
  late final FirebaseAuth firebaseAuth;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
    firebaseAuth = FirebaseAuth.instance;
    sharedPreferences = widget.sharedPreferences;
    sharedPrefDatasource = SharedPrefDatasource(sharedPreferences);
    authRepo = AuthRepoImpl(
      firebaseAuth: firebaseAuth,
      localDatasource: sharedPrefDatasource,
    );
    loginUseCase = LoginUseCase(authRepo);
    logOutUseCase = LogOutUseCase(authRepo);
    registerUseCase = RegisterUseCase(authRepo);
    loginCheckUseCase = LoginCheckUseCase(authRepo);
    authBloc = AuthBloc(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
      logOutUseCase: logOutUseCase,
      loginCheckUseCase: loginCheckUseCase,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authBloc),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light(),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}

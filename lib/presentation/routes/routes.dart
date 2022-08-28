import 'package:auto_route/annotations.dart';
import 'package:moviez_app/presentation/views/error/error_page.dart';
import 'package:moviez_app/presentation/views/wrapper/auth_wrapper.dart';

import '../views/auth/pages/login_page.dart';
import '../views/auth/pages/register_page.dart';
import '../views/home/pages/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "authWrapper",
      page: AuthWrapper,
      initial: true,
    ),
    AutoRoute(
      path: "login",
      page: LoginPage,
    ),
    AutoRoute(
      path: "register",
      page: RegisterPage,
    ),
    AutoRoute(
      path: "home",
      page: HomePage,
    ),
    AutoRoute(
      path: "error",
      page: ErrorPage,
    ),
  ],
)
class $AppRouter {}
import 'package:auto_route/annotations.dart';

import '../views/auth/pages/login_page.dart';
import '../views/auth/pages/register_page.dart';
import '../views/error/error_page.dart';
import '../views/favorite/pages/favorite_page.dart';
import '../views/home/pages/home_page.dart';
import '../views/home/pages/see_all_page.dart';
import '../views/movie_detail/pages/movie_detail_page.dart';
import '../views/news/pages/news_page.dart';
import '../views/settings/pages/settings_page.dart';
import '../views/wrapper/auth_wrapper.dart';
import '../views/wrapper/dashboard_wrapper.dart';
import '../views/wrapper/home_wrapper.dart';

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
      path: "error",
      page: ErrorPage,
    ),
    AutoRoute(
      path: "dashboardWrapper",
      page: DashboardWrapper,
      children: [
        AutoRoute(
          path: "homeWrapper",
          page: HomeWrapper,
          children: [
            AutoRoute(
              path: "home",
              page: HomePage,
              initial: true,
            ),
            AutoRoute(
              path: "seeAll",
              page: SeeAllPage,
            ),
          ],
        ),
        AutoRoute(
          path: "favorite",
          page: FavoritePage,
        ),
        AutoRoute(
          path: "news",
          page: NewsPage,
        ),
        AutoRoute(
          path: "settings",
          page: SettingsPage,
        ),
      ],
    ),
    AutoRoute(
      path: "movieDetail",
      page: MovieDetailPage,
    ),
  ],
)
class $AppRouter {}

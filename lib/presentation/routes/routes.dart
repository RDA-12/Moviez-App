import 'package:auto_route/annotations.dart';
import 'package:moviez_app/presentation/views/news/pages/news_detail_page.dart';
import 'package:moviez_app/presentation/views/settings/pages/profile_page.dart';
import 'package:moviez_app/presentation/views/watchlist/pages/watchlist_page.dart';
import 'package:moviez_app/presentation/views/wrapper/news_wrapper.dart';
import 'package:moviez_app/presentation/views/wrapper/settings_wrapper.dart';

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
          path: "newsWrapper",
          page: NewsWrapper,
          children: [
            AutoRoute(
              path: "news",
              page: NewsPage,
              initial: true,
            ),
            AutoRoute(
              path: "newsDetail",
              page: NewsDetailPage,
            )
          ],
        ),
        AutoRoute(
          path: "settingsWrapper",
          page: SettingsWrapper,
          children: [
            AutoRoute(
              path: "settings",
              page: SettingsPage,
              initial: true,
            ),
            AutoRoute(
              path: "profile",
              page: ProfilePage,
            )
          ],
        ),
      ],
    ),
    AutoRoute(
      path: "movieDetail",
      page: MovieDetailPage,
    ),
    AutoRoute(
      path: "favorite",
      page: FavoritePage,
    ),
    AutoRoute(
      path: "watchlist",
      page: WatchlistPage,
    )
  ],
)
class $AppRouter {}

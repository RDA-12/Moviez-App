// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../domain/entity/movie.dart' as _i15;
import '../views/auth/pages/login_page.dart' as _i2;
import '../views/auth/pages/register_page.dart' as _i3;
import '../views/error/error_page.dart' as _i4;
import '../views/favorite/pages/favorite_page.dart' as _i8;
import '../views/home/pages/home_page.dart' as _i11;
import '../views/home/pages/see_all_page.dart' as _i12;
import '../views/movie_detail/pages/movie_detail_page.dart' as _i6;
import '../views/news/pages/news_page.dart' as _i9;
import '../views/settings/pages/settings_page.dart' as _i10;
import '../views/wrapper/auth_wrapper.dart' as _i1;
import '../views/wrapper/dashboard_wrapper.dart' as _i5;
import '../views/wrapper/home_wrapper.dart' as _i7;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AuthWrapper.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthWrapper());
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ErrorPage(key: args.key, message: args.message));
    },
    DashboardWrapper.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.DashboardWrapper());
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.MovieDetailPage(key: args.key, movie: args.movie));
    },
    HomeWrapper.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeWrapper());
    },
    FavoriteRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FavoritePage());
    },
    NewsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.NewsPage());
    },
    SettingsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SettingsPage());
    },
    HomeRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HomePage());
    },
    SeeAllRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.SeeAllPage(
              key: args.key, movies: args.movies, title: args.title));
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig('/#redirect',
            path: '/', redirectTo: 'authWrapper', fullMatch: true),
        _i13.RouteConfig(AuthWrapper.name, path: 'authWrapper'),
        _i13.RouteConfig(LoginRoute.name, path: 'login'),
        _i13.RouteConfig(RegisterRoute.name, path: 'register'),
        _i13.RouteConfig(ErrorRoute.name, path: 'error'),
        _i13.RouteConfig(DashboardWrapper.name,
            path: 'dashboardWrapper',
            children: [
              _i13.RouteConfig(HomeWrapper.name,
                  path: 'homeWrapper',
                  parent: DashboardWrapper.name,
                  children: [
                    _i13.RouteConfig('#redirect',
                        path: '',
                        parent: HomeWrapper.name,
                        redirectTo: 'home',
                        fullMatch: true),
                    _i13.RouteConfig(HomeRoute.name,
                        path: 'home', parent: HomeWrapper.name),
                    _i13.RouteConfig(SeeAllRoute.name,
                        path: 'seeAll', parent: HomeWrapper.name)
                  ]),
              _i13.RouteConfig(FavoriteRoute.name,
                  path: 'favorite', parent: DashboardWrapper.name),
              _i13.RouteConfig(NewsRoute.name,
                  path: 'news', parent: DashboardWrapper.name),
              _i13.RouteConfig(SettingsRoute.name,
                  path: 'settings', parent: DashboardWrapper.name)
            ]),
        _i13.RouteConfig(MovieDetailRoute.name, path: 'movieDetail')
      ];
}

/// generated route for
/// [_i1.AuthWrapper]
class AuthWrapper extends _i13.PageRouteInfo<void> {
  const AuthWrapper() : super(AuthWrapper.name, path: 'authWrapper');

  static const String name = 'AuthWrapper';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i13.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i14.Key? key, required String message})
      : super(ErrorRoute.name,
            path: 'error', args: ErrorRouteArgs(key: key, message: message));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.message});

  final _i14.Key? key;

  final String message;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [_i5.DashboardWrapper]
class DashboardWrapper extends _i13.PageRouteInfo<void> {
  const DashboardWrapper({List<_i13.PageRouteInfo>? children})
      : super(DashboardWrapper.name,
            path: 'dashboardWrapper', initialChildren: children);

  static const String name = 'DashboardWrapper';
}

/// generated route for
/// [_i6.MovieDetailPage]
class MovieDetailRoute extends _i13.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({_i14.Key? key, required _i15.Movie movie})
      : super(MovieDetailRoute.name,
            path: 'movieDetail',
            args: MovieDetailRouteArgs(key: key, movie: movie));

  static const String name = 'MovieDetailRoute';
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({this.key, required this.movie});

  final _i14.Key? key;

  final _i15.Movie movie;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i7.HomeWrapper]
class HomeWrapper extends _i13.PageRouteInfo<void> {
  const HomeWrapper({List<_i13.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i8.FavoritePage]
class FavoriteRoute extends _i13.PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: 'favorite');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i9.NewsPage]
class NewsRoute extends _i13.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.SeeAllPage]
class SeeAllRoute extends _i13.PageRouteInfo<SeeAllRouteArgs> {
  SeeAllRoute(
      {_i14.Key? key, required List<_i15.Movie> movies, required String title})
      : super(SeeAllRoute.name,
            path: 'seeAll',
            args: SeeAllRouteArgs(key: key, movies: movies, title: title));

  static const String name = 'SeeAllRoute';
}

class SeeAllRouteArgs {
  const SeeAllRouteArgs({this.key, required this.movies, required this.title});

  final _i14.Key? key;

  final List<_i15.Movie> movies;

  final String title;

  @override
  String toString() {
    return 'SeeAllRouteArgs{key: $key, movies: $movies, title: $title}';
  }
}

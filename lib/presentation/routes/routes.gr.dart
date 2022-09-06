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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../../domain/entity/movie.dart' as _i17;
import '../views/auth/pages/login_page.dart' as _i2;
import '../views/auth/pages/register_page.dart' as _i3;
import '../views/error/error_page.dart' as _i4;
import '../views/favorite/pages/favorite_page.dart' as _i8;
import '../views/home/pages/home_page.dart' as _i11;
import '../views/home/pages/see_all_page.dart' as _i12;
import '../views/movie_detail/pages/movie_detail_page.dart' as _i6;
import '../views/news/pages/news_detail_page.dart' as _i14;
import '../views/news/pages/news_page.dart' as _i13;
import '../views/settings/pages/settings_page.dart' as _i10;
import '../views/wrapper/auth_wrapper.dart' as _i1;
import '../views/wrapper/dashboard_wrapper.dart' as _i5;
import '../views/wrapper/home_wrapper.dart' as _i7;
import '../views/wrapper/news_wrapper.dart' as _i9;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AuthWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthWrapper());
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ErrorPage(key: args.key, message: args.message));
    },
    DashboardWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.DashboardWrapper());
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.MovieDetailPage(key: args.key, movie: args.movie));
    },
    HomeWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeWrapper());
    },
    FavoriteRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FavoritePage());
    },
    NewsWrapper.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.NewsWrapper());
    },
    SettingsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SettingsPage());
    },
    HomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.HomePage());
    },
    SeeAllRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.SeeAllPage(
              key: args.key, movies: args.movies, title: args.title));
    },
    NewsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.NewsPage());
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.NewsDetailPage(key: args.key, url: args.url));
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig('/#redirect',
            path: '/', redirectTo: 'authWrapper', fullMatch: true),
        _i15.RouteConfig(AuthWrapper.name, path: 'authWrapper'),
        _i15.RouteConfig(LoginRoute.name, path: 'login'),
        _i15.RouteConfig(RegisterRoute.name, path: 'register'),
        _i15.RouteConfig(ErrorRoute.name, path: 'error'),
        _i15.RouteConfig(DashboardWrapper.name,
            path: 'dashboardWrapper',
            children: [
              _i15.RouteConfig(HomeWrapper.name,
                  path: 'homeWrapper',
                  parent: DashboardWrapper.name,
                  children: [
                    _i15.RouteConfig('#redirect',
                        path: '',
                        parent: HomeWrapper.name,
                        redirectTo: 'home',
                        fullMatch: true),
                    _i15.RouteConfig(HomeRoute.name,
                        path: 'home', parent: HomeWrapper.name),
                    _i15.RouteConfig(SeeAllRoute.name,
                        path: 'seeAll', parent: HomeWrapper.name)
                  ]),
              _i15.RouteConfig(FavoriteRoute.name,
                  path: 'favorite', parent: DashboardWrapper.name),
              _i15.RouteConfig(NewsWrapper.name,
                  path: 'newsWrapper',
                  parent: DashboardWrapper.name,
                  children: [
                    _i15.RouteConfig('#redirect',
                        path: '',
                        parent: NewsWrapper.name,
                        redirectTo: 'news',
                        fullMatch: true),
                    _i15.RouteConfig(NewsRoute.name,
                        path: 'news', parent: NewsWrapper.name),
                    _i15.RouteConfig(NewsDetailRoute.name,
                        path: 'newsDetail', parent: NewsWrapper.name)
                  ]),
              _i15.RouteConfig(SettingsRoute.name,
                  path: 'settings', parent: DashboardWrapper.name)
            ]),
        _i15.RouteConfig(MovieDetailRoute.name, path: 'movieDetail')
      ];
}

/// generated route for
/// [_i1.AuthWrapper]
class AuthWrapper extends _i15.PageRouteInfo<void> {
  const AuthWrapper() : super(AuthWrapper.name, path: 'authWrapper');

  static const String name = 'AuthWrapper';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i15.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i16.Key? key, required String message})
      : super(ErrorRoute.name,
            path: 'error', args: ErrorRouteArgs(key: key, message: message));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.message});

  final _i16.Key? key;

  final String message;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [_i5.DashboardWrapper]
class DashboardWrapper extends _i15.PageRouteInfo<void> {
  const DashboardWrapper({List<_i15.PageRouteInfo>? children})
      : super(DashboardWrapper.name,
            path: 'dashboardWrapper', initialChildren: children);

  static const String name = 'DashboardWrapper';
}

/// generated route for
/// [_i6.MovieDetailPage]
class MovieDetailRoute extends _i15.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({_i16.Key? key, required _i17.Movie movie})
      : super(MovieDetailRoute.name,
            path: 'movieDetail',
            args: MovieDetailRouteArgs(key: key, movie: movie));

  static const String name = 'MovieDetailRoute';
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({this.key, required this.movie});

  final _i16.Key? key;

  final _i17.Movie movie;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i7.HomeWrapper]
class HomeWrapper extends _i15.PageRouteInfo<void> {
  const HomeWrapper({List<_i15.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i8.FavoritePage]
class FavoriteRoute extends _i15.PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: 'favorite');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i9.NewsWrapper]
class NewsWrapper extends _i15.PageRouteInfo<void> {
  const NewsWrapper({List<_i15.PageRouteInfo>? children})
      : super(NewsWrapper.name, path: 'newsWrapper', initialChildren: children);

  static const String name = 'NewsWrapper';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.SeeAllPage]
class SeeAllRoute extends _i15.PageRouteInfo<SeeAllRouteArgs> {
  SeeAllRoute(
      {_i16.Key? key, required List<_i17.Movie> movies, required String title})
      : super(SeeAllRoute.name,
            path: 'seeAll',
            args: SeeAllRouteArgs(key: key, movies: movies, title: title));

  static const String name = 'SeeAllRoute';
}

class SeeAllRouteArgs {
  const SeeAllRouteArgs({this.key, required this.movies, required this.title});

  final _i16.Key? key;

  final List<_i17.Movie> movies;

  final String title;

  @override
  String toString() {
    return 'SeeAllRouteArgs{key: $key, movies: $movies, title: $title}';
  }
}

/// generated route for
/// [_i13.NewsPage]
class NewsRoute extends _i15.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i14.NewsDetailPage]
class NewsDetailRoute extends _i15.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i16.Key? key, required String url})
      : super(NewsDetailRoute.name,
            path: 'newsDetail', args: NewsDetailRouteArgs(key: key, url: url));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.url});

  final _i16.Key? key;

  final String url;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, url: $url}';
  }
}

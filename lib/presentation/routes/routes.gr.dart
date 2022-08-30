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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../views/auth/pages/login_page.dart' as _i2;
import '../views/auth/pages/register_page.dart' as _i3;
import '../views/error/error_page.dart' as _i4;
import '../views/favorite/pages/favorite_page.dart' as _i7;
import '../views/home/pages/home_page.dart' as _i6;
import '../views/news/pages/news_page.dart' as _i8;
import '../views/settings/pages/settings_page.dart' as _i9;
import '../views/wrapper/auth_wrapper.dart' as _i1;
import '../views/wrapper/home_wrapper.dart' as _i5;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthWrapper.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthWrapper());
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ErrorPage(key: args.key, message: args.message));
    },
    HomeWrapper.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeWrapper());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    FavoriteRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavoritePage());
    },
    NewsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.NewsPage());
    },
    SettingsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SettingsPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: 'authWrapper', fullMatch: true),
        _i10.RouteConfig(AuthWrapper.name, path: 'authWrapper'),
        _i10.RouteConfig(LoginRoute.name, path: 'login'),
        _i10.RouteConfig(RegisterRoute.name, path: 'register'),
        _i10.RouteConfig(ErrorRoute.name, path: 'error'),
        _i10.RouteConfig(HomeWrapper.name, path: 'homeWrapper', children: [
          _i10.RouteConfig(HomeRoute.name,
              path: 'home', parent: HomeWrapper.name),
          _i10.RouteConfig(FavoriteRoute.name,
              path: 'favorite', parent: HomeWrapper.name),
          _i10.RouteConfig(NewsRoute.name,
              path: 'news', parent: HomeWrapper.name),
          _i10.RouteConfig(SettingsRoute.name,
              path: 'settings', parent: HomeWrapper.name)
        ])
      ];
}

/// generated route for
/// [_i1.AuthWrapper]
class AuthWrapper extends _i10.PageRouteInfo<void> {
  const AuthWrapper() : super(AuthWrapper.name, path: 'authWrapper');

  static const String name = 'AuthWrapper';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.ErrorPage]
class ErrorRoute extends _i10.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i11.Key? key, required String message})
      : super(ErrorRoute.name,
            path: 'error', args: ErrorRouteArgs(key: key, message: message));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.message});

  final _i11.Key? key;

  final String message;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [_i5.HomeWrapper]
class HomeWrapper extends _i10.PageRouteInfo<void> {
  const HomeWrapper({List<_i10.PageRouteInfo>? children})
      : super(HomeWrapper.name, path: 'homeWrapper', initialChildren: children);

  static const String name = 'HomeWrapper';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.FavoritePage]
class FavoriteRoute extends _i10.PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: 'favorite');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i8.NewsPage]
class NewsRoute extends _i10.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

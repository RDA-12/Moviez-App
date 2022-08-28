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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../views/auth/pages/login_page.dart' as _i2;
import '../views/auth/pages/register_page.dart' as _i3;
import '../views/error/error_page.dart' as _i5;
import '../views/home/pages/home_page.dart' as _i4;
import '../views/wrapper/auth_wrapper.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthWrapper.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthWrapper());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ErrorPage(key: args.key, message: args.message));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: 'authWrapper', fullMatch: true),
        _i6.RouteConfig(AuthWrapper.name, path: 'authWrapper'),
        _i6.RouteConfig(LoginRoute.name, path: 'login'),
        _i6.RouteConfig(RegisterRoute.name, path: 'register'),
        _i6.RouteConfig(HomeRoute.name, path: 'home'),
        _i6.RouteConfig(ErrorRoute.name, path: 'error')
      ];
}

/// generated route for
/// [_i1.AuthWrapper]
class AuthWrapper extends _i6.PageRouteInfo<void> {
  const AuthWrapper() : super(AuthWrapper.name, path: 'authWrapper');

  static const String name = 'AuthWrapper';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ErrorPage]
class ErrorRoute extends _i6.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({_i7.Key? key, required String message})
      : super(ErrorRoute.name,
            path: 'error', args: ErrorRouteArgs(key: key, message: message));

  static const String name = 'ErrorRoute';
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.message});

  final _i7.Key? key;

  final String message;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, message: $message}';
  }
}

part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticating extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class AuthenticationError extends AuthState {
  final String msg;
  const AuthenticationError(this.msg);

  @override
  List<Object> get props => [msg];
}

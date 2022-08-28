part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {
  final String email;
  final String password;
  const Login({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class Register extends AuthEvent {
  final String email;
  final String password;
  const Register({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class Logout extends AuthEvent {}

class LoginCheck extends AuthEvent {}

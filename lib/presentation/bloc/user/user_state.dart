part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class LoadingUser extends UserState {}

class UserLoaded extends UserState {
  final User user;
  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoadingError extends UserState {
  final String msg;
  const UserLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}

class LoadingUserOperation extends UserState {}

class UserOperationSuccess extends UserState {}

class UserOperationFailed extends UserState {
  final String msg;
  const UserOperationFailed(this.msg);

  @override
  List<Object> get props => [msg];
}

class UserDeleted extends UserState {}

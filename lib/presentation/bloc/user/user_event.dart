part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {}

class UpdateUser extends UserEvent {
  final String email;
  final String username;
  final String password;
  final Map<String, dynamic> image;

  const UpdateUser({
    this.email = "",
    this.username = "",
    this.password = "",
    this.image = const {},
  });

  @override
  List<Object> get props => [email, username, password, image];
}

class DeleteUser extends UserEvent {}

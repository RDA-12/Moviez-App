import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String username;
  final String profileImgUrl;
  const User({
    required this.email,
    required this.profileImgUrl,
    required this.username,
  });

  @override
  List<Object?> get props => [email, profileImgUrl, username];
}

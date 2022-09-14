import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../repositories/user_repo.dart';

class UpdateUserUseCase extends UseCase<void, Params> {
  final UserRepo repo;
  UpdateUserUseCase(this.repo);

  @override
  Future<void> call(Params params) async {
    await repo.updateUser(
      username: params.username,
      image: params.image,
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String? username;
  final Map<String, dynamic>? image;
  final String? email;
  final String? password;
  const Params({this.username, this.image, this.email, this.password});

  @override
  List<Object?> get props => [username, image, email, password];
}

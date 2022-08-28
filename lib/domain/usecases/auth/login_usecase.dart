import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../repositories/auth_repo.dart';

class LoginUseCase implements UseCase<void, Params> {
  final AuthRepo repo;
  LoginUseCase(this.repo);

  @override
  Future<void> call(Params params) async {
    try {
      await repo.login(
        email: params.email,
        password: params.password,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

import 'package:moviez_app/core/usecases/usecase.dart';
import 'package:moviez_app/domain/repositories/auth_repo.dart';

import '../../../core/usecases/no_params.dart';

class LoginCheckUseCase extends UseCase<bool, NoParams> {
  final AuthRepo repo;
  LoginCheckUseCase(this.repo);

  @override
  Future<bool> call(NoParams params) async {
    return repo.loginCheck();
  }
}

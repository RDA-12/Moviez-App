import 'package:moviez_app/core/usecases/usecase.dart';

import '../../../core/usecases/no_params.dart';
import '../../repositories/user_repo.dart';

class DeleteUserUseCase implements UseCase<void, NoParams> {
  final UserRepo repo;
  DeleteUserUseCase(this.repo);

  @override
  Future<void> call(NoParams params) async {
    await repo.deleteUser();
  }
}

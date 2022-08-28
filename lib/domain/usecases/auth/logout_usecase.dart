import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/auth_repo.dart';

class LogOutUseCase implements UseCase<void, NoParams> {
  final AuthRepo repo;
  LogOutUseCase(this.repo);

  @override
  Future<void> call(NoParams params) async {
    try {
      await repo.logout();
    } catch (e) {
      rethrow;
    }
  }
}

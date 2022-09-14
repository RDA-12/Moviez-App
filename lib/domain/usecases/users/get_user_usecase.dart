import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/user.dart';
import '../../repositories/user_repo.dart';

class GetUserUseCase extends UseCase<User, NoParams> {
  final UserRepo repo;
  GetUserUseCase(this.repo);

  @override
  Future<User> call(NoParams params) async {
    return await repo.getUser();
  }
}

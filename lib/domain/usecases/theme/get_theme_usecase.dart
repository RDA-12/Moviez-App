import '../../../core/usecases/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/theme_repo.dart';

class GetThemeUseCase extends UseCase<bool, NoParams> {
  final ThemeRepo repo;
  GetThemeUseCase(this.repo);

  @override
  Future<bool> call(NoParams params) async {
    return repo.isDarkTheme();
  }
}

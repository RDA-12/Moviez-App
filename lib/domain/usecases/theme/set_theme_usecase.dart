import 'package:equatable/equatable.dart';

import '../../../core/usecases/usecase.dart';
import '../../repositories/theme_repo.dart';

class SetThemeUseCase extends UseCase<void, Params> {
  final ThemeRepo repo;
  SetThemeUseCase(this.repo);

  @override
  Future<void> call(Params params) async {
    await repo.setTheme(isDark: params.isDark);
  }
}

class Params extends Equatable {
  final bool isDark;
  const Params(this.isDark);

  @override
  List<Object?> get props => [isDark];
}

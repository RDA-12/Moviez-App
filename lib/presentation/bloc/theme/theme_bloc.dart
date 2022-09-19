import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/usecases/theme/get_theme_usecase.dart';
import '../../../domain/usecases/theme/set_theme_usecase.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;
  ThemeBloc({
    required this.getThemeUseCase,
    required this.setThemeUseCase,
  }) : super(const ThemeState(false)) {
    on<ToggleTheme>((event, emit) async {
      final bool currentTheme = state.isDark;
      await setThemeUseCase(Params(!currentTheme));
      emit(ThemeState(!currentTheme));
    });
    on<GetTheme>((event, emit) async {
      final bool currentTheme = await getThemeUseCase(NoParams());
      emit(ThemeState(currentTheme));
    });
  }
}

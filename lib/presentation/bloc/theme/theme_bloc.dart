import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(false)) {
    on<ToggleTheme>((event, emit) {
      final currentTheme = state.isDark;
      emit(ThemeState(!currentTheme));
    });
  }
}
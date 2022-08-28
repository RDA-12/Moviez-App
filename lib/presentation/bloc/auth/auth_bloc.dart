import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/usecases/auth/login_check_usecase.dart';
import '../../../domain/usecases/auth/login_usecase.dart' as login;
import '../../../domain/usecases/auth/logout_usecase.dart' as logout;
import '../../../domain/usecases/auth/register_usecase.dart' as register;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final login.LoginUseCase loginUseCase;
  final register.RegisterUseCase registerUseCase;
  final logout.LogOutUseCase logOutUseCase;
  final LoginCheckUseCase loginCheckUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logOutUseCase,
    required this.loginCheckUseCase,
  }) : super(AuthInitial()) {
    on<Login>((event, emit) async {
      emit(Authenticating());
      final String email = event.email;
      final String password = event.password;
      try {
        await loginUseCase(
          login.Params(
            email: email,
            password: password,
          ),
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
    on<Register>((event, emit) async {
      emit(Authenticating());
      final String email = event.email;
      final String password = event.password;
      try {
        await registerUseCase(
          register.Params(
            email: email,
            password: password,
          ),
        );
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
    on<Logout>((event, emit) async {
      emit(Authenticating());
      try {
        await logOutUseCase(NoParams());
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
    on<LoginCheck>((event, emit) async {
      emit(Authenticating());
      final isLogin = await loginCheckUseCase(NoParams());
      if (isLogin) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    });
  }
}

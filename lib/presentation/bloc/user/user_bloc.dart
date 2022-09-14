import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/no_params.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/usecases/users/delete_user_usecase.dart';
import '../../../domain/usecases/users/get_user_usecase.dart';
import '../../../domain/usecases/users/update_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  UserBloc({
    required this.getUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  }) : super(UserInitial()) {
    on<GetUser>((event, emit) async {
      emit(LoadingUser());
      try {
        final User user = await getUserUseCase(NoParams());
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserLoadingError(e.toString()));
      }
    });
    on<UpdateUser>((event, emit) async {
      emit(LoadingUserOperation());
      try {
        final String email = event.email;
        final String password = event.password;
        final Map<String, dynamic> image = event.image;
        final String username = event.username;
        await updateUserUseCase(
          Params(
            email: email.isEmpty ? null : email,
            password: password.isEmpty ? null : password,
            image: image.isEmpty ? null : image,
            username: username.isEmpty ? null : username,
          ),
        );
        emit(UserOperationSuccess());
      } catch (e) {
        emit(UserOperationFailed(e.toString()));
      }
      try {
        final User user = await getUserUseCase(NoParams());
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserLoadingError(e.toString()));
      }
    });
    on<DeleteUser>((event, emit) async {
      emit(LoadingUserOperation());
      try {
        await deleteUserUseCase(NoParams());
        emit(UserDeleted());
      } catch (e) {
        emit(UserOperationFailed(e.toString()));
      }
    });
  }
}

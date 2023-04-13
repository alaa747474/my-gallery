import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/features/auth/data/models/log_in_model.dart';
import 'package:task_app/features/auth/data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final AuthRepository _authRepository;
  loginAndGetUserData({required String email, required String password}) async {
    await _authRepository
        .loginAndGetUserData(email: email, password: password)
        .then((value) {
      emit(UserLogedInSuccessfully(value));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_app/features/auth/data/cache/app_secure_storage.dart';

part 'user_state_state.dart';

class UserStateCubit extends Cubit<UserStateState> {
  UserStateCubit() : super(UserStateInitial());
  getUserToken() {
    AppSecureStorage.instance.getCurrentUserData(key: 'TOKEN').then((value) {
      emit(UserTokenLoaded(value));
    });
  }
}

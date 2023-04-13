import 'package:task_app/features/auth/data/models/log_in_model.dart';

abstract class BaseAuthRepository {
  Future<LoginModel> loginAndGetUserData({required String email,required String password});
}
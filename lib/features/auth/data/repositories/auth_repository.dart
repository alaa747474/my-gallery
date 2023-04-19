import 'package:dio/dio.dart';
import 'package:task_app/core/constants/end_points.dart';
import 'package:task_app/core/service/dio_helper.dart';
import 'package:task_app/features/auth/data/models/log_in_model.dart';
import 'package:task_app/features/auth/data/repositories/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final DioHelper _dioHelper;
  AuthRepository(this._dioHelper);
  
  @override
  Future<LoginModel> loginAndGetUserData(
      {required String email, required String password}) async {
    Response userDate = await _dioHelper.postData(
        endPoint: AppEndPoints.login,
        data: {'email': email, 'password': password});

    return LoginModel.fromJson(userDate.data);
  }
}

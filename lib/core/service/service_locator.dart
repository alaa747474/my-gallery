import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/core/constants/end_points.dart';
import 'package:task_app/core/service/dio_helper.dart';
import 'package:task_app/features/auth/data/repositories/auth_repository.dart';
import 'package:task_app/features/gallery/data/repositories/gallery_repository.dart';

GetIt getIt =GetIt.instance;
setUpServiceLocator(){
  getIt.registerSingleton(DioHelper(dioSetUp()));
  getIt.registerSingleton(AuthRepository(getIt.get<DioHelper>()));
  getIt.registerSingleton(GalleryRepository(getIt.get<DioHelper>()));
}
Dio dioSetUp() {
  Dio dio = Dio();
  dio
    ..options.baseUrl = AppEndPoints.baseUrl
    ..options.connectTimeout = const Duration(seconds: 40)
    ..options.receiveTimeout = const Duration(seconds: 40);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    requestBody: false,
  ));

  return dio;
}

import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);

  Future getData({required String endPoint, String? token}) async {
    _dio.options.headers = {'authorization': 'Bearer $token'};
    Response response = await _dio.get(endPoint);
    return response.data;
  }

  Future postData(
      {required String endPoint, dynamic data, String? token}) async {
   return await _dio.post(endPoint,
        data: data,
        options: Options(headers: {
          'authorization': token != null ? 'Bearer $token' : '',
          'Content-Type': 'application/json'
        }));
  }
}

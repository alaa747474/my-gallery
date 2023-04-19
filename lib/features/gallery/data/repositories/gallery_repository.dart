import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/constants/end_points.dart';
import 'package:task_app/core/service/dio_helper.dart';
import 'package:task_app/features/auth/data/cache/app_secure_storage.dart';
import 'package:task_app/features/gallery/data/models/gallery.dart';
import 'package:task_app/features/gallery/data/repositories/base_gallery_repository.dart';

class GalleryRepository extends BaseGalleryRepository {
  final DioHelper _dioHelper;
  GalleryRepository(this._dioHelper);
  @override
  Future<Gallery?> getGallery() async {
    String? token =
        await AppSecureStorage.instance.getCurrentUserData(key: 'TOKEN');
    if (token != null) {
      Response response = await _dioHelper.getData(
          endPoint: AppEndPoints.myGallery, token: token);
      return Gallery.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<void> uploadImage({required String imgPath}) async {
    String? token =
        await AppSecureStorage.instance.getCurrentUserData(key: 'TOKEN');
    try {
      FormData formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(
          imgPath,
        ),
      });
      await _dioHelper.postData(
          endPoint: AppEndPoints.uploadImage, data: formData, token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

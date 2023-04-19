import 'package:task_app/features/gallery/data/models/gallery.dart';

abstract class BaseGalleryRepository {
  Future<Gallery?> getGallery();
  Future<void> uploadImage({required String imgPath});
}

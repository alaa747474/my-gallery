import 'package:task_app/features/gallery/data/models/gallery_images.dart';

class Gallery {
  String? status;
  GalleryImages? galleryImages;
  String? message;

  Gallery({this.status, this.galleryImages, this.message});

  Gallery.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    galleryImages = GalleryImages.fromJson(json['data']);
    message = json['message'];
  }


}


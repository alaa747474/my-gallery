part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}
class GalleryLoaded extends GalleryState {
  final Gallery gallery;

  GalleryLoaded(this.gallery);
}

class ImageUploaded extends GalleryState {
}
class ImagePicked extends GalleryState {
  final File img;

  ImagePicked(this.img);
}

class GalleryFailure extends GalleryState {
  final String error;

  GalleryFailure(this.error);
}
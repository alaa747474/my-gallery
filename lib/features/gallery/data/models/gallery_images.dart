class GalleryImages {
  List<String>? images;

  GalleryImages({this.images});

  GalleryImages.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
  }

}
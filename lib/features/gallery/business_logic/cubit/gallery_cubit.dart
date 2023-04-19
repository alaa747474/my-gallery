import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:task_app/core/utils/image_picker_helper.dart';
import 'package:task_app/features/gallery/data/models/gallery.dart';
import 'package:task_app/features/gallery/data/repositories/gallery_repository.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this._galleryRepository) : super(GalleryInitial());
  final GalleryRepository _galleryRepository;
 void getGallery()async{
   await _galleryRepository.getGallery().then((value) {
      emit(GalleryLoaded(value!));
    });
  }

  uploadImage({required String imgPath})async{
    _galleryRepository.uploadImage(imgPath: imgPath).then((value) {
      getGallery();
      emit(ImageUploaded());
    }).catchError((error){
      emit(GalleryFailure(error));
    });
  }

  pickImage({required ImageSource imageSource}){
    ImagePickerHelper.instance.pickImage(imageSource).then((value) {
      emit(ImagePicked(value!));
    });
  }
 
}

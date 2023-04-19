import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/widgets/app_background.dart';
import 'package:task_app/features/gallery/presentation/widgets/upload_image_button.dart';
import 'package:task_app/features/gallery/presentation/widgets/gallery_images_list_view.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBackground(
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          const UploadImgaeButton(),
          const Expanded(child: GalleryImagesListview())
        ],
      ),
    ));
  }
}

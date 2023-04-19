
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_app/core/constants/app_assets.dart';
import 'package:task_app/core/utils/utils.dart';
import 'package:task_app/features/gallery/business_logic/cubit/gallery_cubit.dart';
import 'package:task_app/features/gallery/presentation/widgets/upload_image_source_button.dart';

class UploadImgaeButton extends StatelessWidget {
  const UploadImgaeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryState>(
      listener: (context, state) {
        if (state is ImagePicked) {
          context.read<GalleryCubit>().uploadImage(imgPath: state.img.path);
        }
        if (state is ImageUploaded) {
          context.read<GalleryCubit>().getGallery();
        }
      },
      builder: (context, state) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Theme.of(context).cardColor.withOpacity(0.4),
                maximumSize: Size(130.r, 45.r),
                minimumSize: Size(100.r, 40.r)),
            onPressed: () {
              Utils.instanse.showCustomDialog(
                  context: context,
                  onPressed: () {},
                  child: Column(
                    children: [
                      UploadImageSourceButton(
                          image: AppAssets.camera,
                          text: 'Camera',
                          color: Theme.of(context).primaryColor.withRed(200),
                          onPressed: () {
                            context
                                .read<GalleryCubit>()
                                .pickImage(imageSource: ImageSource.camera);
                          }),
                      SizedBox(
                        height: 10.h,
                      ),
                      UploadImageSourceButton(
                          image: AppAssets.galleryIcon,
                          text: 'gallery',
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            context
                                .read<GalleryCubit>()
                                .pickImage(imageSource: ImageSource.gallery);
                          }),
                    ],
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30.r,
                  height: 30.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.red),
                  child: const Center(
                    child: Icon(Icons.keyboard_arrow_up_sharp),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Upload',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/features/gallery/business_logic/cubit/gallery_cubit.dart';

class GalleryImagesListview extends StatelessWidget {
  const GalleryImagesListview({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        
        if (state is GalleryLoaded) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.r,vertical: 20.r),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 90.r,
            crossAxisSpacing: 10.r,
            mainAxisSpacing: 10.r,
            crossAxisCount: 3,
          ),
          itemCount: state.gallery.galleryImages!.images!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                    blurRadius:10,
                    offset:const Offset(0,1)
                  )],
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(image: NetworkImage(state.gallery.galleryImages!.images![index]),fit: BoxFit.cover)),
            );
          },
        );
        }
        return const SizedBox();
      },
    );
  }
}

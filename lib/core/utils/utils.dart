import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/service/service_locator.dart';
import 'package:task_app/features/gallery/data/repositories/gallery_repository.dart';

import '../../features/gallery/business_logic/cubit/gallery_cubit.dart';

class Utils {
  Utils._();
  static final instanse = Utils._();
  Future<void> showCustomDialog(
      {required BuildContext context, required VoidCallback onPressed,required Widget child}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          ),
          backgroundColor: Colors.white.withOpacity(0.2),
          content: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => GalleryCubit(getIt.get<GalleryRepository>()),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

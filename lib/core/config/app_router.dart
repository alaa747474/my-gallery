import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/constants/app_routes.dart';
import 'package:task_app/core/service/service_locator.dart';
import 'package:task_app/features/auth/presentation/screens/log_in_screen.dart';
import 'package:task_app/features/gallery/business_logic/cubit/gallery_cubit.dart';
import 'package:task_app/features/gallery/data/repositories/gallery_repository.dart';
import 'package:task_app/features/gallery/presentation/screens/gallery_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.logInScreen:
        return MaterialPageRoute(builder:(context) => const LogInScreen());
          case AppRoutes.galleryScreen:
        return MaterialPageRoute(builder:(context)=> BlocProvider(
          create: (context) => GalleryCubit(getIt.get<GalleryRepository>())..getGallery(),
          child: const GalleryScreen(),
        ));
    }
    return null;
  }
}
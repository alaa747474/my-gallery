import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/config/app_router.dart';
import 'package:task_app/core/config/theme.dart';
import 'package:task_app/core/constants/app_routes.dart';
import 'package:task_app/core/service/service_locator.dart';
import 'package:task_app/features/auth/data/cache/app_secure_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await AppSecureStorage.instance.userAuthState();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        AppSecureStorage.instance.getCurrentUserData(key: 'TOKEN').then((value) => null);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MY GALLERY',
          theme: AppTheme.theme(),

          initialRoute:AppSecureStorage.instance.isLogged==true?AppRoutes.galleryScreen:AppRoutes.logInScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}


// email : tremayne.altenwerth@example.com
// password : password
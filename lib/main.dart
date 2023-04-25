import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/config/app_router.dart';
import 'package:task_app/core/config/theme.dart';
import 'package:task_app/core/constants/app_routes.dart';
import 'package:task_app/core/service/service_locator.dart';
import 'package:task_app/features/auth/business_logic/user_state_cubit/user_state_cubit.dart';
import 'package:task_app/features/auth/data/cache/app_secure_storage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
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
        AppSecureStorage.instance
            .getCurrentUserData(key: 'TOKEN')
            .then((value) => null);
        return BlocProvider(
            create: (context) => UserStateCubit()..getUserToken(),
            child: BlocBuilder<UserStateCubit, UserStateState>(
              builder: (context, state) {
                if (state is UserTokenLoaded) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'MY GALLERY',
                    theme: AppTheme.theme(),
                    initialRoute: state.token != null
                        ? AppRoutes.galleryScreen
                        : AppRoutes.logInScreen,
                    onGenerateRoute: AppRouter.generateRoute,
                  );
                }
                return const CircularProgressIndicator();
              },
            ));
      },
    );
  }
}


// email : tremayne.altenwerth@example.com
// password : password
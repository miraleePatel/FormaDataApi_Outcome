// ignore_for_file: constant_identifier_Names, prefer_const_constructors


import 'package:get/get.dart';
import 'package:photo_editing_app/Routes/routes.dart';
import 'package:photo_editing_app/Screens/ImageEdit/edit_screen.dart';

import 'package:photo_editing_app/Screens/home_screen.dart';
import 'package:photo_editing_app/Screens/show_image_screen.dart';
import 'package:photo_editing_app/Screens/zoom_image_screen.dart';

import '../Screens/Onboarding/onboading_screen.dart';
import '../Screens/Onboarding/splash_screen.dart';

class AppPages {
  static const INITIAL_ROUTE = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.ONBOADING_SCREEN,
      page: () => const OnboardingScreen(),
    ),GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const HomeScreen(),
    ),GetPage(
      name: Routes.EDIT_SCREEN,
      page: () => const EditScreen(),
    ),GetPage(
      name: Routes.SHOW_IMAGE_SCREEN,
      page: () => const ShowImageScreen(),
    ),GetPage(
      name: Routes.Zoom_IMAGE_SCREEN,
      page: () => const ZoomImageScreen(),
    ),

  ];
}

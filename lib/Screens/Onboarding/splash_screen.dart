
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:photo_editing_app/Utils/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';
import '../../Utils/constants.dart';
import '../../generated/assets.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigatToRoute();
    super.initState();
  }

  ///
  /// navigate according login users
  ///
  navigatToRoute() async {

   /* Future.delayed(
      const Duration(seconds: 5),
    ).then((value) async {
      Get.offAllNamed(Routes.ONBOADING_SCREEN);
    });*/
    if (GetStorage().read(onboarding) == null || GetStorage().read(onboarding) == false) {
      Future.delayed(
        const Duration(seconds: 3),
      ).then((value) async {
        Get.offAllNamed(Routes.ONBOADING_SCREEN);
      });
    } else {
      Future.delayed(
        const Duration(seconds: 3),
      ).then((value) async {
        Get.offAllNamed(Routes.HOME_SCREEN);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: AppColors.blackColor,
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: /*Image.asset(
              Assets.imagesOnboadingVerse,
              scale: 3,
            )*/
            // editoPic
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 10.h,
                    width: 10.h,
                    child: Image.asset(Assets.imagesLogo)),
              SizedBox(height: 1.h,),
                DefaultTextStyle(
                  style:  TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.skyBlueColor
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('editoPic'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

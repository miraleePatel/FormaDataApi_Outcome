import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/app_colors.dart';
import '../../Widgets/custom_widget.dart';
import '../../generated/assets.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen( this.page,
      this.notifier,{super.key});

  final int page;
  final ValueNotifier<double> notifier;

  @override
  Widget build(BuildContext context) {
    return SlidingPage(
      notifier: notifier,
      page: page,
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          Center(
            child: FractionallySizedBox(
              widthFactor: 0.55,
              heightFactor: 0.18,
              child: SlidingContainer(
                  child: Image.asset(
                    Assets.imagesPcImage,
                  )),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Align(
              alignment: const Alignment(0.3, -0.35),
              child: FractionallySizedBox(
                widthFactor: 0.75,
                heightFactor: 0.20,
                child: SlidingContainer(
                    offset: 170,
                    child: Image.asset(
                      'assets/s_2_2.png',
                    )),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.2, -0.27),
            child: FractionallySizedBox(
              widthFactor: 0.16,
              heightFactor: 0.07,
              child: SlidingContainer(
                  offset: 50,
                  child: Image.asset(
                    Assets.imagesSale,
                  )),
            ),
          ),
          Align(
            alignment: const Alignment(0.3, -0.30),
            child: FractionallySizedBox(
              widthFactor: 0.14,
              heightFactor: 0.07,
              child: SlidingContainer(
                  offset: 150,
                  child: Image.asset(
                    Assets.imagesImagesShare,
                  )),
            ),
          ),

          Align(
            alignment: const Alignment(0.7, 0.1),
            child: FractionallySizedBox(
              widthFactor: 0.25,
              heightFactor: 0.15,
              child: SlidingContainer(
                  offset: 200,
                  child: Image.asset(
                    Assets.imagesPhotoIcon,
                  )),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.40),
            child: SlidingContainer(
              offset: 250,
              child: CustomWidgets.text("Welccome to editoPic",
                  color: AppColors.skyBlueColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Align(
              alignment: Alignment(0, 0.65),
              child: SlidingContainer(
                offset: 250,
                child: CustomWidgets.text(
                    "Experience the ease of erasing unwanted elements and distractions with a touch of magic.",
                    color: AppColors.skyBlueColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    maxLine: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

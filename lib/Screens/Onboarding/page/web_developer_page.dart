import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:get/get.dart';
import 'package:photo_editing_app/Widgets/custom_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../Routes/routes.dart';
import '../../../Utils/app_colors.dart';
import '../../../Widgets/custom_button.dart';
import '../../../generated/assets.dart';

class WebDevelopersPage extends StatelessWidget {
  const WebDevelopersPage(
    this.page,
    this.notifier, {
    super.key,
  });

  final int page;
  final ValueNotifier<double> notifier;

  @override
  Widget build(BuildContext context) {
    return SlidingPage(
      page: page,
      notifier: notifier,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100.h,
            width: 100.h,
            child: SlidingContainer(
                offset: 300,
                child: Image.asset(
                  Assets.imagesStartCrop,
                )),
          ),

          Align(
            alignment: Alignment(0, 0.50),
            child: SlidingContainer(
              offset: 250,
              child: CustomWidgets.text("Customize your picture with editoPic App",
                  color: AppColors.skyBlueColor,
                  fontSize: 14.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500),
            ),
          ),

          GestureDetector(
            onTap: (){
                Get.offAllNamed(Routes.HOME_SCREEN);
            },
            child: Align(
              alignment: const Alignment(0, 0.78),
              child: SlidingContainer(
                offset: 250,
                child:Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: CustomButton(text: "Start Now",),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_colors.dart';
import '../generated/assets.dart';
import 'custom_widget.dart';

class CustomContainer extends StatelessWidget {
   String? text;
   String? imageName;
   CustomContainer({super.key,this.text,this.imageName});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 5.h,
      width: 5.h,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.white30,
              offset: const Offset(7, 7),
              blurRadius: 9.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          Image.asset(imageName??""),
          SizedBox(height: 1.h,),
          CustomWidgets.text(text??"",color: AppColors.skyBlueColor,fontWeight: FontWeight.w500),
          Spacer()
        ],
      ),
    );
  }
}

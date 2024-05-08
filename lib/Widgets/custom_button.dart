import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_colors.dart';
import 'custom_widget.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final double? height;
  final double? width;
  final String? text;
  final Gradient? gradient;
  const CustomButton({super.key,this.onTap,this.height,this.width,this.text,this.gradient});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 7.h,
        width:width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient??
          LinearGradient(
            colors: [
              AppColors.blueLinearColor1,
              AppColors.blueLinearColor2,
                         ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomWidgets.text(text!,color: AppColors.whiteColor,fontWeight: FontWeight.w700),
      ),
    );
  }
}


class CustomBorderButton extends StatelessWidget {
  final Function()? onTap;
  final double? height;
  final double? width;
  final String? text;
  final String? imageName;
  const CustomBorderButton({super.key,this.onTap,this.height,this.width,this.text,this.imageName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height?? 6.5.h,
        width:width?? 37.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.skyBlueColor, width: 2),
          borderRadius: BorderRadius.circular(20),
            color: Colors.black
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            imageName == "" && imageName == null?Container() :  Image.asset(imageName??"",scale: 3),
           SizedBox(width: 8,),
            CustomWidgets.text(text!,
                color: AppColors.skyBlueColor,
                fontWeight: FontWeight.w700),  Spacer(),
          ],
        ),
      ),
    );
  }
}

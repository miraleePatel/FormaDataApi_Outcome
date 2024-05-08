import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_colors.dart';

class CustomWidgets {
  static Text text(String content,
      {Color? color,
      double? fontSize = 13,
      FontWeight? fontWeight = FontWeight.normal,
      int? maxLine,
      double? letterSpacing = 0.0,
      TextAlign? textAlign,
      double? height,
      TextOverflow? overflow,
      TextDecoration? decoration,
      Color? backgroundColor,
      bool? softWrap = true,
      Paint? background}) {
    return Text(
      content,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      softWrap: softWrap,
      style: GoogleFonts.poppins(
        letterSpacing: letterSpacing,
        color: color,
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        decoration: decoration,
        backgroundColor: backgroundColor,
        background: background,
        height: height,
      ),
    );
  }

  static Container customIcon({
    required String imageName,
    double? height,
    double? width,
    Color? color
  }) {
    return Container(
        height: height ?? 3.h,
        width: width ?? 3.h,
        child: Image.asset(imageName,color: color,));
  }

  static Container squreContainer(
      {Widget? child,
      double? height,
      double? width,
      ImageProvider<Object>? image,
      double size = 1.0,
      BoxFit? boxFit}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          // color: AppColors.bgColor,
          image: DecorationImage(image: image!, scale: size, fit: boxFit),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  static shimmerImage(
      {required String image, BoxFit? fit, double? height, double? width}) {
    return SizedBox(
      height: height ?? 5.8.h,
      width: width ?? 5.8.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          50,
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: AppColors.texfeildColor,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

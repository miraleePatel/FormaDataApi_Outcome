import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editing_app/Widgets/custom_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_colors.dart';
import '../generated/assets.dart';

// ignore: must_be_immutable
class ZoomImageScreen extends StatefulWidget {

  const ZoomImageScreen({Key? key,}) : super(key: key);

  @override
  State<ZoomImageScreen> createState() => _ZoomImageScreenState();
}

class _ZoomImageScreenState extends State<ZoomImageScreen> {
  var fileImage = Get.arguments[0];
  String tag = Get.arguments[1];

  @override
  void initState() {
    // TODO: implement initState
    print("image........................${fileImage}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: CustomWidgets.text("Image",color: AppColors.skyBlueColor,fontSize: 12.sp,fontWeight: FontWeight.w500),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(Assets.iconLeftChevron),
            )),
        actions: [
          GestureDetector(
              onTap: () async {
                final directory =
                await getApplicationDocumentsDirectory();
                final image = File('${directory.path}/editoPic.png');
                image.writeAsBytesSync(fileImage);
                await Share.shareFiles([image.path]);
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(Assets.iconShare),
              )),
        ],

      ),
      body: Container(
        height: SizerUtil.deviceType == DeviceType.mobile ? 80.h : 85.h,
        width: SizerUtil.deviceType == DeviceType.mobile ? 90.w : 93.w,
        margin:  EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,

        child:/* Hero(
          tag: 'edit_image',
          child: Image.memory(
            fileImage,
            fit: BoxFit.fill,
          ),
        ),*/PhotoView(
          imageProvider: FileImage(File(fileImage)),
          heroAttributes: PhotoViewHeroAttributes(tag: tag),
          //enableRotation: true,
          // minScale: PhotoViewComputedScale.covered ,
          // maxScale: PhotoViewComputedScale.covered * 0.9,
          // initialScale: PhotoViewComputedScale.covered,
          basePosition: Alignment.center,
        )
      ),
    );
  }
}

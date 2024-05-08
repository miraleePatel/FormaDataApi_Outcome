import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../Controller/local_controller.dart';
import '../Routes/routes.dart';
import '../Services/image_database_helper.dart';
import '../Utils/app_colors.dart';
import '../Widgets/custom_widget.dart';
import '../generated/assets.dart';

class ShowImageScreen extends StatefulWidget {
  const ShowImageScreen({super.key});

  @override
  State<ShowImageScreen> createState() => _ShowImageScreenState();
}

class _ShowImageScreenState extends State<ShowImageScreen> {
  LocalController localController = Get.put(LocalController());
  final ImageDatabaseHelper dbHelper = ImageDatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _fetchSavedVideos();
  }

  Future<void> _fetchSavedVideos() async {
    localController.savedImages.value = await dbHelper.getImageWithVerseNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: CustomWidgets.text("Edited",color: AppColors.skyBlueColor,fontSize: 12.sp,fontWeight: FontWeight.w500),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(Assets.iconLeftChevron),
            )),
      ),

      body: Obx((){
        return  localController.savedImages.isNotEmpty ?
        Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: localController.savedImages.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 5,
                crossAxisSpacing: 8,
                maxCrossAxisExtent: 120,
                mainAxisExtent: 140),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.Zoom_IMAGE_SCREEN,arguments:[localController.savedImages[index].path,localController.savedImages[index].id.toString()]);
                },
                child: Column(
                  children: [
                    Hero(
                      tag: localController.savedImages[index].id.toString(),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          // color: AppColors.aapbarColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: AppColors.skyBlueColor.withOpacity(0.4)),
                            image: DecorationImage(
                              /*  image: FileImage(
                                    File(localController.savedImages[index].path)),*/
                              image: FileImage(File(localController.savedImages[index].path!)),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              );
            },
          ),
        ):
        Center(
          child: CustomWidgets.text("No Image Found", fontWeight: FontWeight.w600,
              fontSize: 9.sp,
              color: AppColors.whiteColor),
        );
      })
    );
  }
}

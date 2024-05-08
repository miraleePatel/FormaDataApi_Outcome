import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editing_app/Utils/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../Controller/ads_controller.dart';
import '../Controller/camera_controller.dart';
import '../Routes/routes.dart';
import '../Services/permission_service.dart';
import '../Utils/constants.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_container.dart';
import '../Widgets/custom_widget.dart';
import '../generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController cameraController = Get.put(CameraController());
  AdsController adsController = Get.put(AdsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      Assets.assetsHomeBg,
                    ),
                    fit: BoxFit.cover)
                // image: DecorationImage(image: AssetImage(Assets.assetsHomeBg2,),fit: BoxFit.fitWidth)
                ),
            child: Container(
              alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20,right: 20),
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
SizedBox(height: 5.h,),
                  Container(
                      height: 10.h,
                      width: 10.h,
                      child: Image.asset(Assets.imagesLogo)),
                  CustomWidgets.text("editoPic",
                      color: AppColors.skyBlueColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: 5.h,),
                  CustomBorderButton(
                    onTap: () async {
                      await PermissionHandlerPermissionService
                          .handlePhotosPermission(context)
                          .then((bool galleryPermission) async {
                        if (galleryPermission == true) {
                          await cameraController
                              .openImagePicker(ImageSource.gallery)
                              .then((value) async {
                            if (value.path.isNotEmpty || value.path != "") {
                              cameraController.imageName.value =
                                  value.path.split("/").last;
                              cameraController.imagePath.value = value.path;
                              Get.toNamed(Routes.EDIT_SCREEN,
                                  arguments: value.path);
                            }
                            print(
                                "Image Name :::: ${cameraController.imageName}");
                            print(
                                "Image Path :::: ${cameraController.imagePath}");
                          });
                        }
                      });
                      //
                    },
                    width: double.infinity,
                    imageName: Assets.iconPhoto,text: "GALLERY",),
                  SizedBox(
                    height: 3.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBorderButton(
                          onTap: () async {
                            Platform.isIOS
                                ? await cameraController
                                .openImagePicker(ImageSource.camera)
                                .then((value) async {
                              if (value.path.isNotEmpty || value.path != "") {
                                cameraController.imageName.value =
                                    value.path.split("/").last;
                                cameraController.imagePath.value = value.path;
                                Get.toNamed(Routes.EDIT_SCREEN,
                                    arguments: value.path);
                              }
                              print(
                                  "Image Name :::: ${cameraController.imageName}");
                              print(
                                  "Image Path :::: ${cameraController.imagePath}");
                            })
                                : await PermissionHandlerPermissionService
                                .handleCameraPermission(context)
                                .then((bool cameraPermission) async {
                              if (cameraPermission == true) {
                                await cameraController
                                    .openImagePicker(ImageSource.camera)
                                    .then((value) async {
                                  if (value.path.isNotEmpty || value.path != "") {
                                    cameraController.imageName.value =
                                        value.path.split("/").last;
                                    cameraController.imagePath.value = value.path;
                                    Get.toNamed(Routes.EDIT_SCREEN,
                                        arguments: value.path);
                                  }
                                  print(
                                      "Image Name :::: ${cameraController.imageName}");
                                  print(
                                      "Image Path :::: ${cameraController.imagePath}");
                                });
                              }
                            });
                          },
                          imageName: Assets.iconCamera,text: "CAMERA",),
                        SizedBox(width: 3.w,),
                        CustomBorderButton(
                          onTap: () {
                            Get.toNamed(Routes.SHOW_IMAGE_SCREEN);
                          },
                    
                          imageName: Assets.iconEdited,text: "EDITED",),
                      ],
                    ),
                  )
                ],
              ),
            )

          /*GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
              padding: EdgeInsets.only(right: 20, left: 20, top: 150),
              children: [
                GestureDetector(
                  onTap: () async {
                    await PermissionHandlerPermissionService
                            .handlePhotosPermission(context)
                        .then((bool galleryPermission) async {
                      if (galleryPermission == true) {
                        await cameraController
                            .openImagePicker(ImageSource.gallery)
                            .then((value) async {
                          if (value.path.isNotEmpty || value.path != "") {
                            cameraController.imageName.value =
                                value.path.split("/").last;
                            cameraController.imagePath.value = value.path;
                            Get.toNamed(Routes.EDIT_SCREEN,
                                arguments: value.path);
                          }
                          print(
                              "Image Name :::: ${cameraController.imageName}");
                          print(
                              "Image Path :::: ${cameraController.imagePath}");
                        });
                      }
                    });
                    //
                  },
                  child: CustomContainer(
                    text: "GALLERY",
                    imageName: Assets.iconPhoto,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Platform.isIOS
                        ? await cameraController
                            .openImagePicker(ImageSource.camera)
                            .then((value) async {
                            if (value.path.isNotEmpty || value.path != "") {
                              cameraController.imageName.value =
                                  value.path.split("/").last;
                              cameraController.imagePath.value = value.path;
                              Get.toNamed(Routes.EDIT_SCREEN,
                                  arguments: value.path);
                            }
                            print(
                                "Image Name :::: ${cameraController.imageName}");
                            print(
                                "Image Path :::: ${cameraController.imagePath}");
                          })
                        : await PermissionHandlerPermissionService
                                .handleCameraPermission(context)
                            .then((bool cameraPermission) async {
                            if (cameraPermission == true) {
                              await cameraController
                                  .openImagePicker(ImageSource.camera)
                                  .then((value) async {
                                if (value.path.isNotEmpty || value.path != "") {
                                  cameraController.imageName.value =
                                      value.path.split("/").last;
                                  cameraController.imagePath.value = value.path;

                                    Get.toNamed(Routes.EDIT_SCREEN,
                                        arguments: value.path);

                                }

                                print(
                                    "Image Name :::: ${cameraController.imageName}");
                                print(
                                    "Image Path :::: ${cameraController.imagePath}");
                              });
                            }
                          });
                  },
                  child: CustomContainer(
                    text: "CAMERA",
                    imageName: Assets.iconCamera,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SHOW_IMAGE_SCREEN);
                  },
                  child: CustomContainer(
                    text: "EDITED",
                    imageName: Assets.iconEdited,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomContainer(
                    text: "SETTING",
                    imageName: Assets.iconSettings,
                  ),
                ),
              ],
            )*/
        ));
  }
}

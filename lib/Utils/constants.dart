import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

const onboarding = 'onboarding1';


RxBool isDarkMode = false.obs;
RxBool isDark = false.obs;
RxString boxPath = ''.obs;
List boxNameList = [];

///
/// Show progress indicator when API call Or any other async method call
///
showProgressIndicator() {
  return EasyLoading.show(
    maskType: EasyLoadingMaskType.black,
    status: 'Loading',
    dismissOnTap: false,
  );
}

///
/// Dismiss progress indicator after API calling Or any other async method calling
///
dismissProgressIndicator() {
  return EasyLoading.dismiss();
}

///
/// Snackbar for showing error message
///
errorSnackBar({String? title, String? message}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title ?? 'Error',
        style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      messageText: Text(
        message!,
        style: const TextStyle(color: Colors.white, fontSize: 12, height: 1.0, fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.BOTTOM,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.withOpacity(0.80),

      icon: const Icon(Icons.gpp_bad_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(
        seconds: 3,
      ),
    ),
  );
}

///
/// Snackbar for showing success message
///
successSnackBar({String? title, String? message}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title ?? 'Success',
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.0, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message!,
        style: const TextStyle(color: Colors.white, fontSize: 12, height: 1.0, fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.withOpacity(0.80),

      icon: const Icon(Icons.task_alt_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    ),
  );
}

informationSnackBar({String? title, String? message,IconData? icon,}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      title: title,
      messageText: Text(
        message!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 1.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.BOTTOM,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      backgroundColor: AppColors.blueLinearColor2.withOpacity(0.8),
      icon:  Icon( icon ?? Icons.copy, size: 25.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    ),
  );
}
/// color convert in to string
String colorToHex(Color color) {
  return '#' + color.value.toRadixString(16).substring(2).toUpperCase();
}




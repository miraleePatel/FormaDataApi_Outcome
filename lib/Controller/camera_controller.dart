import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController{
  RxInt imageIndex = (-1).obs;
  RxInt fontIndex = (0).obs;
  RxBool isArrangeSize = false.obs;
  var imageName = ''.obs;
  var imagePath = ''.obs;



  /// Image Picker
  Future<File> openImagePicker(ImageSource sourceData) async {
    XFile? xFile = await ImagePicker().pickImage(
      source: sourceData,
    );
    return File(xFile!.path);
  }
}
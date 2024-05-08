import 'package:get/get.dart';

import '../Services/image_model.dart';

class LocalController extends GetxController{
  RxList<ImageModel> savedImages = <ImageModel>[].obs;
}
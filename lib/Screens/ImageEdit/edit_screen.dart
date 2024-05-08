import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editing_app/Controller/local_controller.dart';
import 'package:photo_editing_app/Utils/app_colors.dart';
import '../../Controller/ads_controller.dart';
import '../../Services/ad_helper.dart';
import '../../Services/image_database_helper.dart';
import '../../Services/permission_service.dart';
import '../../Utils/CustomPackage/pro_image_editor_main.dart';
import '../../Utils/constants.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  String? file = Get.arguments;
  InterstitialAd? _interstitialAd;

  final ImageDatabaseHelper dbHelper = ImageDatabaseHelper.instance;
  LocalController localController  = Get.put(LocalController());
  AdsController adsController = Get.put(AdsController());


  @override
  void initState() {
    adsController.createInterstitialAd();
    super.initState();

  }



  void _showInterstitialAd(Uint8List image) {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) async {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        adsController.createInterstitialAd();
        _saved(image);

        // Get.back(closeOverlays: true);
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        adsController.createInterstitialAd();
      }
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(15), 
              child: Image.asset(Assets.iconLeftChevron),
            )),

        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(Assets.iconDownload),
          )
        ],
      ),*/

      body:ProImageEditor.file(File (file!.toString()), onImageEditingComplete: (imageByte) async {
        print("...............................");
        print(imageByte);
        //

        await PermissionHandlerPermissionService
            .handlePhotosPermission(context)
            .then((bool photoPermission) async {
          if (photoPermission == true) {
            // _saveImageToGallery(imageBytes:imageByte ,folderName: "editoPic");

            _saved(imageByte);


         /*   if (_interstitialAd != null) {
              _showInterstitialAd(imageByte);
            }*/

          }else{
            print("...........error...........");
          }
        }).then((value) {
          informationSnackBar(
              message:'Save Image to Gallery');


        });

      },onCloseEditor: (){
        print("hello");
        Get.back(closeOverlays: true);
      },),
    );
  }

  _saved(image) async {
    RxInt name = 0.obs;
    final result = await ImageGallerySaver.saveImage(image);

    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/${result['filePath'].split("/").last.split(".").first}.png').create();

    print("tempDir............${tempDir.path}");

    if(result['isSuccess'] == true){
      successSnackBar(title: "Save Image",message: "Save Image to Gallery");
      /// Save Image Locally
      file.writeAsBytes(image).then((value) async {
        await dbHelper
            .insertImage(value.path)
            .then((value) async {
          localController.savedImages.value = await dbHelper.getImageWithVerseNames();
          // successSnackBar(title: "Save Image",message: "Save Image to Locally");
          print("localController.savedImages.value.........${localController.savedImages.length}");
          Get.back();

        });
      });

    }else{
      errorSnackBar(title: "Image error",message: "Something went to wrong");
    }
    if (kDebugMode) {

      print("result.........$result");
    }
    if (kDebugMode) {
      print("File Saved to Gallery");
    }
  }

/*  _saveImageToGallery({required Uint8List imageBytes, required String folderName}) async {

    final Directory newFolder;
    if (Platform.isIOS) {
      Directory dPath = await getApplicationDocumentsDirectory();
      newFolder = Directory("${dPath.path}/$folderName");
      // "/Users/ios/Library/Developer/CoreSimulator/Devices/FD8F73A0-23C2-4145-8520-D50EC70F03D9/data/Containers/Data/Application/02E54384-D63D-40EB-9E99-80DEEC6D4871/Documents/Bible")
    } else {
      final directory = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DCIM);
      newFolder = Directory('${directory}/$folderName');
    }

     log("name directory ---------- $newFolder");

    if (!await newFolder.exists()) {
      await newFolder.create(recursive: true);
    }
    final fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
    final imageFile = File('${newFolder.path}/$fileName');
    await imageFile.writeAsBytes(imageBytes);
    // Optionally, you can save the image to the system's gallery using the `ImageGallerySaver` plugin
    // final result = await ImageGallerySaver.saveImage(imageBytes, name: fileName);
    final result = await ImageGallerySaver.saveImage(imageBytes, name: fileName);
    if (result['isSuccess'] == true) {
      print("Image saved to gallery.");
      print(result);
    } else {
      print("Failed to save image to gallery.");
    }
  }*/

}

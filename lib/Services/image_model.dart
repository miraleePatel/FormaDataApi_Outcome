import 'dart:typed_data';

class ImageModel {
   int? id;
   // Uint8List? path;
   String? path;

  ImageModel({
    required this.id,
    required this.path,
  });
/*
  ImageModel.fromJson(Map<String, dynamic> map){
    this.id = map['id'];
    this.path = map['path'];
    }

  ImageModel.toJson(){
    Map<String, dynamic> map=Map<String, dynamic>();
    map['id']= this.id;
    map['path']= this.path;

  }*/

}


import 'package:flutter/material.dart';
import 'package:photo_editing_app/Utils/CustomPackage/models/editor_image.dart';
import 'package:photo_editing_app/Utils/CustomPackage/utils/design_mode.dart';



import '../../../models/filter_state_history.dart';

import '../../../widgets/auto_image.dart';
import '../utils/generate_filtered_image.dart';

class ImageWithMultipleFilters extends StatelessWidget {
  final double width;
  final double height;
  final ImageEditorDesignModeE designMode;
  final List<FilterStateHistory> filters;
  final EditorImage image;

  const ImageWithMultipleFilters({
    super.key,
    required this.width,
    required this.height,
    required this.designMode,
    required this.filters,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Widget img = AutoImage(
      image,
      fit: BoxFit.contain,
      width: width,
      height: height,
      designMode: designMode,
    );

    Widget filteredImg = img;
    for (var filter in filters) {
      filteredImg = generateFilteredImage(
        child: filteredImg,
        filter: filter.filter,
        opacity: filter.opacity,
      );
    }

    return Stack(
      children: [
        img,
        filteredImg,
      ],
    );
  }
}

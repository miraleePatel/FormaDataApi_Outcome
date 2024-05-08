import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/custom_widget.dart';
import '../../../generated/assets.dart';

/// A custom widget for the header row of a bottom sheet.
class BottomSheetHeaderRow extends StatefulWidget {
  /// Creates a [BottomSheetHeaderRow] widget with the specified title, theme, and padding.
  const BottomSheetHeaderRow({
    super.key,
    required this.title,
    required this.theme,
    this.padding,
  });

  /// The title to display in the header row.
  final String title;

  /// The theme data used for styling the header row.
  final ThemeData theme;

  /// Optional padding to apply around the header row.
  final EdgeInsetsGeometry? padding;

  @override
  State<BottomSheetHeaderRow> createState() => _BottomSheetHeaderRowState();
}

class _BottomSheetHeaderRowState extends State<BottomSheetHeaderRow> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: widget.padding ?? const EdgeInsets.only(bottom: 8.0, top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.theme.textTheme.bodyLarge?.color,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {
              Get.back();
              },
              child: CustomWidgets.customIcon(
                  imageName: Assets.iconClose,
                 ),
            ),
          ],
        ),
      );
    });
  }
}

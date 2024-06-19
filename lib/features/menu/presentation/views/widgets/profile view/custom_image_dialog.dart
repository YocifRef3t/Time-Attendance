import 'package:flutter/material.dart';

import '../../../../../../core/constans/colors_constans.dart';

class CustomImageDialog extends StatelessWidget {
  final Function()? onCameraTap;
  final Function()? onGalleryTap;
  const CustomImageDialog({
    super.key,
    this.onCameraTap,
    this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: onCameraTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: MyColors.myWazen),
              borderRadius: const BorderRadius.all(Radius.circular(7)),
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 30,
            ),
          ),
        ),
        GestureDetector(
          onTap: onGalleryTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: MyColors.myWazen),
              borderRadius: const BorderRadius.all(Radius.circular(7)),
            ),
            child: const Icon(
              Icons.collections,
              size: 30,
              color: MyColors.myWazen,
            ),
          ),
        ),
      ],
    );
  }
}

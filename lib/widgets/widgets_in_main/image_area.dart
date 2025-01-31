import 'package:flutter/material.dart';
import 'package:notifications/widgets/widgets_in_main/html_image.dart';

/// Image container in HTML tag.

class ImageArea extends StatelessWidget {
  final VoidCallback onDoubleTap;

  final String imageUrl;

  const ImageArea({super.key, required this.onDoubleTap, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: GestureDetector(onDoubleTap: onDoubleTap, child: HtmlImg(image: imageUrl)))),
      ),
    );
  }
}

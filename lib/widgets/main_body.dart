import 'package:flutter/material.dart';
import 'package:notifications/widgets/widgets_in_main/image_area.dart';
import 'package:notifications/widgets/widgets_in_main/line_url_get_image.dart';

/// Master widget Scaffold body.
class MainBody extends StatelessWidget {
  final VoidCallback onDoubleTap;

  final String imageUrl;

  final VoidCallback setUrlImage;

  final TextEditingController textController;

  const MainBody(
      {super.key,
      required this.onDoubleTap,
      required this.imageUrl,
      required this.setUrlImage,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageArea(onDoubleTap: onDoubleTap, imageUrl: imageUrl),
          const SizedBox(height: 8),
          LineUrlGetImage(controller: textController, getImage: setUrlImage),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}

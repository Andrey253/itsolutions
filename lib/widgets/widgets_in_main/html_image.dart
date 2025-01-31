import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

/// HTML teg img.

class HtmlImg extends StatelessWidget {
  const HtmlImg({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      """<img src="$image" alt="Set the image url and click the right arrow">""",
    );
  }
}

import 'package:flutter/material.dart';

/// Class context menu item template.

class FocusedMenuItem {
  Color? backgroundColor;
  Widget title;
  Icon? trailingIcon;
  Function onPressed;

  FocusedMenuItem({
    this.backgroundColor,
    required this.title,
    this.trailingIcon,
    required this.onPressed,
  });
}

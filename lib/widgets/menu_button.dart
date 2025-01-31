import 'package:flutter/material.dart';
import 'package:notifications/templates/focused_menu_holder.dart';
import 'package:notifications/templates/focused_menu_item.dart';

/// Context menu and button.

class MenuButton extends StatelessWidget {
  final Function setFullScreenFunction;
  
  final Function exitFullscreenFunction;

  const MenuButton({super.key, required this.setFullScreenFunction, required this.exitFullscreenFunction});

  @override
  Widget build(BuildContext context) {
    /// Context menu.
    return FocusedMenuHolder(
        onPressed: () {},
        menuWidth: 250,
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(title: Text("Enter fullscreen"), trailingIcon: Icon(Icons.fullscreen), onPressed: setFullScreenFunction),
          FocusedMenuItem(
              title: Text("Exit fullscreen"), trailingIcon: Icon(Icons.fullscreen_exit), onPressed: exitFullscreenFunction),
        ],
        /// Button context menu.
        child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 6, offset: Offset(0, 6), color: Colors.black26)],
             color: const Color.fromARGB(255, 249, 230, 230),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Icon(Icons.add)),
      );
  }
}
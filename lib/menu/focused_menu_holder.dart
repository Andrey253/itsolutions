import 'package:flutter/material.dart';
import 'package:notifications/menu/focused_menu_detail.dart';
import 'package:notifications/menu/focused_menu_item.dart';

///Context menu template.

class FocusedMenuHolder extends StatefulWidget {
  /// Menu selection button.
  final Widget child;

  final double? menuWidth;

  /// Possible menu choices.
  final List<FocusedMenuItem> menuItems;

  const FocusedMenuHolder({
    super.key,
    required this.child,
    required this.menuItems,
    this.menuWidth,
  });

  @override
  State<FocusedMenuHolder> createState() => _FocusedMenuHolderState();
}

class _FocusedMenuHolderState extends State<FocusedMenuHolder> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = Offset(0, 0);
  Size? childSize;

  getOffset() {
    RenderBox renderBox = containerKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      /// Define Offset and button size.
      childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: containerKey,
      onTap: () => openMenu(context),
      child: widget.child,
    );
  }

  Future openMenu(BuildContext context) async {
    getOffset();

    /// With animation, go to the display of the mode selection menu
    await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              animation = Tween(begin: 0.0, end: 1.0).animate(animation);
              return FadeTransition(
                  opacity: animation,
                  child: FocusedMenuDetails(
                    childOffset: childOffset,
                    childSize: childSize,
                    menuItems: widget.menuItems,
                    menuWidth: widget.menuWidth,
                    child: widget.child,
                  ));
            },
            fullscreenDialog: true,
            opaque: false));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notifications/menu/focused_menu_item.dart';

class FocusedMenuDetails extends StatelessWidget {
  final List<FocusedMenuItem> menuItems;

  final Offset childOffset;

  final Size? childSize;
  final Widget child;

  final double? menuWidth;

  const FocusedMenuDetails({
    super.key,
    required this.menuItems,
    required this.child,
    required this.childOffset,
    required this.childSize,
    required this.menuWidth,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.45;
    final listHeight = menuItems.length * 50.0;

    final maxMenuWidth = menuWidth ?? (size.width * 0.70);
    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final leftOffset = (childOffset.dx + maxMenuWidth) < size.width
        ? childOffset.dx
        : (childOffset.dx - maxMenuWidth + childSize!.width);
    final topOffset = (childOffset.dy + menuHeight + childSize!.height) < size.height
        ? childOffset.dy + childSize!.height
        : childOffset.dy - menuHeight;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
              onTap: () => Navigator.pop(context),

              /// Dimming the screen when the menu opens.
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: (Colors.black).withAlpha((255.0 * 0.7).round()),
                ),
              )),
          Positioned(
            top: topOffset,
            left: leftOffset,
            child: TweenAnimationBuilder(
              duration: Duration(milliseconds: 200),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              tween: Tween(begin: 0.0, end: 1.0),
              child: Container(
                width: maxMenuWidth,
                height: menuHeight,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [const BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 1)]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      FocusedMenuItem item = menuItems[index];
                      Widget listItem = GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            item.onPressed();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 1),
                              color: item.backgroundColor ?? Colors.white,
                              height: 50.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    item.title,
                                    if (item.trailingIcon != null) ...[item.trailingIcon!]
                                  ],
                                ),
                              )));

                      return TweenAnimationBuilder(
                          builder: (context, dynamic value, child) {
                            return Transform(
                              transform: Matrix4.rotationX(1.5708 * value),
                              alignment: Alignment.bottomCenter,
                              child: child,
                            );
                          },
                          tween: Tween(begin: 1.0, end: 0.0),
                          duration: Duration(milliseconds: index * 200),
                          child: listItem);
                    },
                  ),
                ),
              ),
            ),
          ),

          /// Blocking pressing the menu button.
          Positioned(
              top: childOffset.dy,
              left: childOffset.dx,
              child: AbsorbPointer(
                  absorbing: true, child: SizedBox(width: childSize!.width, height: childSize!.height, child: child))),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_controller.dart';

import 'side_menu_item.dart';

class NestedSideMenuBar extends StatefulWidget {
  const NestedSideMenuBar({
    Key? key,
    required this.controller,
    required this.menuItems,
    this.initialIndex,
    required this.menuBarDepth,
    required this.width,
    required this.innerPadding,
    required this.outerPadding,
    required this.color,
    this.fontFamily,
  }) : super(key: key);

  final NestedSideMenuController controller;
  final List<SideMenuItem> menuItems;
  final int? initialIndex;
  final int menuBarDepth;
  final double width;
  final EdgeInsetsGeometry innerPadding;
  final EdgeInsetsGeometry outerPadding;
  final Color color;
  final String? fontFamily;

  @override
  State<NestedSideMenuBar> createState() => _NestedSideMenuBarState();
}

class _NestedSideMenuBarState extends State<NestedSideMenuBar> {
  double? _height;

  void rebuildView() {
    if (context.mounted && !context.debugDoingBuild) {
      setState(() {});
    }
  }

  @override
  void initState() {
    if (widget.initialIndex != null) {
      widget.controller.changeSelectedIndexes(
          menuBarDepth: widget.menuBarDepth,
          index: widget.initialIndex!,
          isSubmenuExist: widget.menuItems[widget.initialIndex!].subMenuList !=
                  null &&
              widget.menuItems[widget.initialIndex!].subMenuList!.isNotEmpty);
    }
    widget.controller.addListener(rebuildView);

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(rebuildView);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int?> controllerIndexes = widget.controller.selectedIndexes;
    return Padding(
      padding: widget.outerPadding,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.width +
                (controllerIndexes.length - 1) * widget.width * 0.7,
            height: _height,
            decoration: BoxDecoration(
              color: widget.color,
            ),
            child: Padding(
              padding: widget.innerPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.menuItems.map(
                    (SideMenuItem item) {
                      // 이하 각각의 버튼부
                      bool isSelected =
                          controllerIndexes[widget.menuBarDepth] ==
                              widget.menuItems.indexOf(item);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultTextStyle(
                            style: TextStyle(
                              fontFamily: widget.fontFamily,
                              fontWeight: isSelected ? FontWeight.bold : null,
                              color: isSelected ? Colors.white : Colors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InkWell(
                                  onTap: () {
                                    widget.controller.changeSelectedIndexes(
                                        menuBarDepth: widget.menuBarDepth,
                                        index: widget.menuItems.indexOf(item),
                                        isSubmenuExist:
                                            item.subMenuList != null &&
                                                item.subMenuList!.isNotEmpty);
                                  },
                                  child: Text(
                                    item.title,
                                    maxLines: 1,
                                  ),
                                ),
                                if (item.subMenuList != null && isSelected)
                                  NestedSideMenuBar(
                                    width: widget.width,
                                    innerPadding: widget.innerPadding,
                                    outerPadding: widget.outerPadding,
                                    controller: widget.controller,
                                    menuBarDepth: widget.menuBarDepth + 1,
                                    color: widget.color,
                                    menuItems: item.subMenuList!,
                                  )
                              ],
                            )),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_controller.dart';

import 'side_menu_item.dart';

class NestedSideMenuBody extends StatefulWidget {
  const NestedSideMenuBody(
      {super.key, required this.controller, required this.menuItems});

  final NestedSideMenuController controller;
  final List<SideMenuItem> menuItems;

  @override
  State<NestedSideMenuBody> createState() => _NestedSideMenuBodyState();
}

class _NestedSideMenuBodyState extends State<NestedSideMenuBody> {
  late SideMenuItem currentSideMenuItem;

  void updateWidget() {
    List<SideMenuItem> menuItems = widget.menuItems;

    /// 1. 컨트롤러에서 notify로 트리거되면 변경된 controller.selectedIndexes 가져옴
    List<int?> selectedIndexes = widget.controller.selectedIndexes;

    /// 2. selected indexes 이용하여 현재 위젯 찾아냄
    for (int i = 0; i < selectedIndexes.length; i++) {
      if (selectedIndexes[i] != null) {
        currentSideMenuItem = menuItems[selectedIndexes[i]!];
      } else {
        break;
      }
      if (currentSideMenuItem.subMenuList != null &&
          currentSideMenuItem.subMenuList!.isNotEmpty) {
        menuItems = currentSideMenuItem.subMenuList!;
      }
    }

    /// 3. 현재 위젯을 초기화하고 리빌드
    setState(() {});
  }

  @override
  void initState() {
    currentSideMenuItem = widget.menuItems[0];
    widget.controller.addListener(updateWidget);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(updateWidget);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return currentSideMenuItem.child;
  }
}

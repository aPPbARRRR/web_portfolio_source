import 'package:flutter/material.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_controller.dart';

class NestedSideMenuBody extends StatefulWidget {
  const NestedSideMenuBody({super.key, required this.controller});

  final NestedSideMenuController controller;

  @override
  State<NestedSideMenuBody> createState() => _NestedSideMenuBodyState();
}

class _NestedSideMenuBodyState extends State<NestedSideMenuBody> {
  void updateWidget() {
    // 위젯을 업데이트함
  }

  @override
  void initState() {
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
    final controller = widget.controller;

    return Center(
      child: Text(''),
    );
  }
}

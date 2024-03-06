// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class SideMenuItem {
  final String? superTitle;
  final String title;
  final void Function()? onTap;
  final Widget child;
  final List<SideMenuItem>? subMenuList;

  SideMenuItem({
    this.superTitle,
    required this.title,
    this.onTap,
    required this.child,
    this.subMenuList,
  });
}

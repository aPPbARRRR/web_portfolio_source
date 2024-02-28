// ignore_for_file: public_member_api_docs, sort_constructors_first
class SideMenuItem {
  final String? superTitle;
  final String title;
  final void Function()? onTap;
  final List<SideMenuItem>? subMenuList;

  SideMenuItem({
    required this.title,
    this.superTitle,
    this.onTap,
    this.subMenuList,
  });
}

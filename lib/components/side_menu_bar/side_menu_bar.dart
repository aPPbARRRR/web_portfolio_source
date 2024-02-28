// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:web_portfolio/components/side_menu_bar/side_menu_item.dart';
import 'package:web_portfolio/components/side_menu_bar/side_menu_bar_controller.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar({
    Key? key,
    required this.controller,
    required this.menuItems,
    this.initialIndex,
    required this.initialDepth,
    required this.width,
    required this.innerPadding,
    required this.outerPadding,
  }) : super(key: key);

  final SideMenuBarController controller;
  final List<SideMenuItem> menuItems;
  final int? initialIndex;
  final int initialDepth;
  final double width;
  final EdgeInsetsGeometry innerPadding;
  final EdgeInsetsGeometry outerPadding;

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  int? _selectedIndex;
  bool _isSubMenuOpened = false;
  double? _height;

  @override
  void initState() {
    if (widget.initialIndex != null) {
      _selectedIndex = widget.initialIndex;
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.initialDepth == 0) {
      widget.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.outerPadding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: StreamBuilder<int>(
            stream: widget.controller.currentDepthStream,
            builder: (context, snapshot) {
              // print(widget.controller.currentDepth);
              return AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: widget.width +
                    (widget.controller.currentDepth) * widget.width * 0.7,
                height: _height,
                decoration: BoxDecoration(
                  color: Color.fromARGB(193, 1, 83, 150),
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
                          final bool isSelected =
                              _selectedIndex == widget.menuItems.indexOf(item);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefaultTextStyle(
                                style: GoogleFonts.ibmPlexSansKr(
                                  textStyle: TextStyle(
                                    fontWeight:
                                        isSelected ? FontWeight.bold : null,
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // // 기본
                                        // // SelectedIndex = indexof(item)
                                        // // 하위 메뉴 있는 경우 컨트롤러 뎁쓰를 이 위젯 뎁쓰에서 + 1
                                        // // setstate
                                        if (!isSelected) {
                                          _selectedIndex =
                                              widget.menuItems.indexOf(item);

                                          if (item.subMenuList != null) {
                                            _isSubMenuOpened = true;
                                            widget.controller.changeDepth(
                                                widget.initialDepth + 1);
                                          } else {
                                            _isSubMenuOpened = false;
                                            widget.controller.changeDepth(
                                                widget.initialDepth);
                                          }
                                          setState(() {});
                                        }

                                        // /// 이미 선택된 경우(SelectedIndex = indexof(item)인 경우)
                                        // /// selectedIndex = null;
                                        // /// 하위 메뉴 있었던 경우 컨트롤러 뎁쓰를 이 위젯 뎁쓰와 같도록
                                        // /// setState
                                        else {
                                          if (item.subMenuList != null) {
                                            _isSubMenuOpened =
                                                !_isSubMenuOpened;
                                            if (_isSubMenuOpened) {
                                              widget.controller.changeDepth(
                                                  widget.initialDepth + 1);
                                            } else {
                                              widget.controller.changeDepth(
                                                  widget.initialDepth);
                                            }
                                          } else {
                                            return;
                                          }

                                          setState(() {});
                                        }
                                      },
                                      child: Text(
                                        item.title,
                                        maxLines: 3,
                                      ),
                                    ),
                                    if (item.subMenuList != null &&
                                        _isSubMenuOpened)
                                      Container(
                                        // 컨테이너 삭제 요
                                        child: isSelected &&
                                                item.subMenuList != null
                                            // 길이가 0 인 경우는 일단 생각하지 않는 것으로 ..
                                            ? SideMenuBar(
                                                width: widget.width,
                                                innerPadding:
                                                    widget.innerPadding,
                                                outerPadding:
                                                    widget.outerPadding,
                                                controller: widget.controller,
                                                initialDepth:
                                                    widget.initialDepth + 1,
                                                menuItems: item.subMenuList!,
                                              )
                                            : null,
                                      )
                                  ],
                                )),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

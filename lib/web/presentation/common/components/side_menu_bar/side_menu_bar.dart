// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';

// import 'package:web_portfolio/web/presentation/common/components/side_menu_bar/side_menu_item.dart';
// import 'package:web_portfolio/web/presentation/common/components/side_menu_bar/side_menu_bar_controller.dart';

// class SideMenuBar extends StatefulWidget {
//   const SideMenuBar(
//       {Key? key,
//       required this.controller,
//       required this.menuItems,
//       this.initialIndex,
//       required this.initialDepth,
//       required this.width,
//       required this.innerPadding,
//       required this.outerPadding,
//       required this.color,
//       this.fontFamily})
//       : super(key: key);

//   final SideMenuBarController controller;
//   final List<SideMenuItem> menuItems;
//   final int? initialIndex;
//   final int initialDepth;
//   final double width;
//   final EdgeInsetsGeometry innerPadding;
//   final EdgeInsetsGeometry outerPadding;
//   final Color color;
//   final String? fontFamily;

//   @override
//   State<SideMenuBar> createState() => _SideMenuBarState();
// }

// class _SideMenuBarState extends State<SideMenuBar> {
//   int? _selectedIndex;
//   bool _isSubMenuOpened = false;
//   double? _height;

//   @override
//   void initState() {
//     if (widget.initialIndex != null) {
//       _selectedIndex = widget.initialIndex;
//       widget.controller.updateWidget(widget.menuItems[0].child);
//     }

//     super.initState();
//   }

//   @override
//   void dispose() {
//     if (widget.initialDepth == 0) {
//       widget.controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: widget.outerPadding,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: StreamBuilder<int>(
//             stream: widget.controller.currentDepthStream,
//             builder: (context, snapshot) {
//               return AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 width: widget.width +
//                     (widget.controller.currentDepth) * widget.width * 0.7,
//                 height: _height,
//                 decoration: BoxDecoration(
//                   color: widget.color,
//                 ),
//                 child: Padding(
//                   padding: widget.innerPadding,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: widget.menuItems.map(
//                         (SideMenuItem item) {
//                           // 이하 각각의 버튼부
//                           final bool isSelected =
//                               _selectedIndex == widget.menuItems.indexOf(item);
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: DefaultTextStyle(
//                                 style: TextStyle(
//                                   fontFamily: widget.fontFamily,
//                                   fontWeight:
//                                       isSelected ? FontWeight.bold : null,
//                                   color:
//                                       isSelected ? Colors.white : Colors.grey,
//                                   overflow: TextOverflow.fade,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         // 해당 버튼이 선택되어 있지 않은 상태
//                                         widget.controller
//                                             .updateWidget(item.child);
//                                         if (!isSelected) {
//                                           _selectedIndex =
//                                               widget.menuItems.indexOf(item);
//                                           if (item.subMenuList != null) {
//                                             _isSubMenuOpened = true;
//                                             widget.controller.changeDepth(
//                                                 widget.initialDepth + 1);
//                                           } else {
//                                             _isSubMenuOpened = false;
//                                             widget.controller.changeDepth(
//                                                 widget.initialDepth);
//                                           }
//                                           setState(() {});
//                                         }

//                                         // 해당 버튼이 선택되어 있는 경우
//                                         else {
//                                           if (item.subMenuList != null) {
//                                             _isSubMenuOpened =
//                                                 !_isSubMenuOpened;
//                                             if (_isSubMenuOpened) {
//                                               widget.controller.changeDepth(
//                                                   widget.initialDepth + 1);
//                                             } else {
//                                               widget.controller.changeDepth(
//                                                   widget.initialDepth);
//                                             }
//                                           } else {
//                                             return;
//                                           }

//                                           setState(() {});
//                                         }
//                                       },
//                                       child: Text(
//                                         item.title,
//                                         maxLines: 3,
//                                       ),
//                                     ),
//                                     if (item.subMenuList != null &&
//                                         _isSubMenuOpened &&
//                                         isSelected)
//                                       SideMenuBar(
//                                         width: widget.width,
//                                         innerPadding: widget.innerPadding,
//                                         outerPadding: widget.outerPadding,
//                                         controller: widget.controller,
//                                         initialDepth: widget.initialDepth + 1,
//                                         color: widget.color,
//                                         menuItems: item.subMenuList!,
//                                       )
//                                   ],
//                                 )),
//                           );
//                         },
//                       ).toList(),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:web_portfolio/web/presentation/common/components/side_menu_bar/side_menu_item.dart';
import 'package:web_portfolio/web/presentation/common/components/side_menu_bar/side_menu_bar_controller.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar(
      {Key? key,
      required this.controller,
      required this.menuItems,
      this.initialIndex,
      required this.menuBarDepth,
      required this.width,
      required this.innerPadding,
      required this.outerPadding,
      required this.color,
      this.fontFamily})
      : super(key: key);

  final SideMenuBarController controller;
  final List<SideMenuItem> menuItems;
  final int? initialIndex;
  final int menuBarDepth;
  final double width;
  final EdgeInsetsGeometry innerPadding;
  final EdgeInsetsGeometry outerPadding;
  final Color color;
  final String? fontFamily;

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
//   int? _selectedIndex;
  bool _isSubMenuOpened = false;
  double? _height;

  // @override
  // void initState() {
  //   if (widget.initialIndex != null) {
  //     widget.controller
  //         .changeSelectedIndexes(widget.menuBarDepth, widget.initialIndex!);
  //   }

  //   super.initState();
  // }

  @override
  void dispose() {
    if (widget.menuBarDepth == 1) {
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
        child: StreamBuilder<List<int>>(
            stream: widget.controller.selectedIndexes,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print(snapshot);
                          },
                          child: Text('asdf')),
                      ElevatedButton(
                          onPressed: () {
                            widget.controller
                                .changeSelectedIndexes(widget.menuBarDepth, 0);
                          },
                          child: Text('asdf')),
                    ],
                  ),
                );
              }

              List<int> selectedIndexes = snapshot.data!;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.width +
                    (selectedIndexes.length - 1) * widget.width * 0.7,
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
                          final bool isSelected =
                              selectedIndexes[widget.menuBarDepth - 1] ==
                                  widget.menuItems.indexOf(item);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefaultTextStyle(
                                style: TextStyle(
                                  fontFamily: widget.fontFamily,
                                  fontWeight:
                                      isSelected ? FontWeight.bold : null,
                                  color:
                                      isSelected ? Colors.white : Colors.grey,
                                  overflow: TextOverflow.fade,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        widget.controller.changeSelectedIndexes(
                                            widget.menuBarDepth,
                                            widget.menuItems.indexOf(item));
                                        // // 해당 버튼이 선택되어 있지 않은 상태
                                        // widget.controller
                                        //     .updateWidget(item.child);
                                        // if (!isSelected) {
                                        //   _selectedIndex =
                                        //       widget.menuItems.indexOf(item);
                                        //   if (item.subMenuList != null) {
                                        //     _isSubMenuOpened = true;
                                        //     widget.controller.changeDepth(
                                        //         widget.menuBarDepth + 1);
                                        //   } else {
                                        //     _isSubMenuOpened = false;
                                        //     widget.controller.changeDepth(
                                        //         widget.menuBarDepth);
                                        //   }
                                        //   setState(() {});
                                        // }

                                        // // 해당 버튼이 선택되어 있는 경우
                                        // else {
                                        //   if (item.subMenuList != null) {
                                        //     _isSubMenuOpened =
                                        //         !_isSubMenuOpened;
                                        //     if (_isSubMenuOpened) {
                                        //       widget.controller.changeDepth(
                                        //           widget.menuBarDepth + 1);
                                        //     } else {
                                        //       widget.controller.changeDepth(
                                        //           widget.menuBarDepth);
                                        //     }
                                        //   } else {
                                        //     return;
                                        //   }

                                        //   setState(() {});
                                        // }
                                      },
                                      child: Text(
                                        item.title,
                                        maxLines: 3,
                                      ),
                                    ),
                                    if (item.subMenuList != null &&
                                        _isSubMenuOpened &&
                                        isSelected)
                                      SideMenuBar(
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
              );
            }),
      ),
    );
  }
}

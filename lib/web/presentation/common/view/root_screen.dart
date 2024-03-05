// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../components/side_menu_bar/side_menu_bar.dart';
// import '../components/side_menu_bar/side_menu_bar_controller.dart';
// import '../components/side_menu_bar/side_menu_item.dart';
// import 'home_screen.dart';
// import 'intro_page.dart';

// class RootScreen extends StatefulWidget {
//   const RootScreen({super.key, required this.navigationShell});

//   final StatefulNavigationShell navigationShell;

//   @override
//   State<RootScreen> createState() => _RootScreenState();
// }

// class _RootScreenState extends State<RootScreen> {
//   Widget currentWidget = const IntroPage();
//   final SideMenuBarController sideMenuBarController = SideMenuBarController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 2, 40, 71),
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Gap(50),
//           SideMenuBar(
//             controller: sideMenuBarController,
//             initialDepth: 0,
//             initialIndex: 0,
//             width: 100,
//             innerPadding: EdgeInsets.fromLTRB(5, 5, 2, 5),
//             outerPadding: EdgeInsets.fromLTRB(30, 30, 2, 10),
//             color: Color.fromARGB(193, 1, 83, 150),
//             fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily,
//             menuItems: [
//               SideMenuItem(title: 'intro', child: IntroPage()), //
//               SideMenuItem(title: 'intro', child: IntroPage()), //
//               SideMenuItem(title: 'intro', child: IntroPage()), //
//             ],
//           ),
//           // SideMenuBody(sideMenuBarController: sideMenuBarController),
//           widget.navigationShell
//         ],
//       ),
//     );
//   }

//   void _onTap(BuildContext context, int index) {
//     widget.navigationShell.goBranch(index);
//   }
// }

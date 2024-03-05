// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_bar.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_controller.dart';

import '../components/side_menu_bar/side_menu_item.dart';
import 'intro_page.dart';
import 'projects_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Widget currentWidget = const IntroPage();
  // final SideMenuBarController sideMenuBarController = SideMenuBarController();
  final NestedSideMenuController menubarContoroller =
      NestedSideMenuController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 40, 71),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NestedSideMenuBar(
            controller: menubarContoroller,
            menuBarDepth: 0,
            initialIndex: 0,
            width: 100,
            innerPadding: EdgeInsets.fromLTRB(5, 5, 2, 5),
            outerPadding: EdgeInsets.fromLTRB(30, 30, 2, 10),
            color: Color.fromARGB(193, 1, 83, 150),
            fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily,
            menuItems: [
              SideMenuItem(
                title: 'Intro',
                child: IntroPage(),
              ),
              SideMenuItem(
                  title: 'Projects',
                  child: ProjectsScreen(),
                  subMenuList: [
                    SideMenuItem(
                        title: '불꽃놀이',
                        child: IntroPage(),
                        subMenuList: [
                          SideMenuItem(
                              title: 'intro',
                              child: IntroPage()), // 어떤 앱? 앱의 기능
                          SideMenuItem(
                              title: 'architecture', child: IntroPage()),
                          SideMenuItem(title: '상태 관리', child: IntroPage()),
                          SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
                          SideMenuItem(title: '이슈', child: IntroPage()),
                        ]),
                    SideMenuItem(
                        title: '당신의숲',
                        child: IntroPage(),
                        subMenuList: [
                          SideMenuItem(
                              title: 'intro',
                              child: IntroPage()), // 어떤 앱? 앱의 기능
                          SideMenuItem(
                              title: 'architecture', child: IntroPage()),
                          SideMenuItem(title: '상태 관리', child: IntroPage()),
                          SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
                          SideMenuItem(title: '이슈', child: IntroPage()),
                        ]),
                    SideMenuItem(
                        title: '냠냠베어',
                        child: IntroPage(),
                        subMenuList: [
                          SideMenuItem(
                              title: 'intro',
                              child: IntroPage()), // 어떤 앱? 앱의 기능
                          SideMenuItem(
                              title: 'architecture', child: IntroPage()),
                          SideMenuItem(title: '상태 관리', child: IntroPage()),
                          SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
                          SideMenuItem(title: '이슈', child: IntroPage()),
                        ]),
                    SideMenuItem(
                        title: '커피랭커',
                        child: IntroPage(),
                        subMenuList: [
                          SideMenuItem(
                              title: 'intro',
                              child: IntroPage()), // 어떤 앱? 앱의 기능
                          SideMenuItem(
                              title: 'architecture', child: IntroPage()),
                          SideMenuItem(title: '상태 관리', child: IntroPage()),
                          SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
                          SideMenuItem(title: '이슈', child: IntroPage()),
                        ]),
                  ]),
              SideMenuItem(title: 'Contact', child: IntroPage()),
            ],
          ),
          // SideMenuBody(sideMenuBarController: sideMenuBarController)
        ],
      ),
    );
  }
}

// class SideMenuBody extends StatelessWidget {
//   const SideMenuBody({
//     super.key,
//     required this.sideMenuBarController,
//   });

//   final SideMenuBarController sideMenuBarController;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: StreamBuilder(
//         stream: sideMenuBarController.currentWidgetStream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return IntroPage(); // 임시. 수정할 것
//           }
//           final Widget widget = snapshot.data!;
//           return widget;
//         },
//       ),
//     );
//   }
// }

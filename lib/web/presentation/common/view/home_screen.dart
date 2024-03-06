// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_bar.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_body.dart';
import 'package:web_portfolio/web/presentation/common/components/nested_side_menu.dart/nested_side_menu_controller.dart';
import 'package:web_portfolio/web/presentation/common/view/side_menu_bar_screen.dart';

import '../components/nested_side_menu.dart/side_menu_item.dart';
import 'intro_page.dart';
import 'projects_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NestedSideMenuController menubarContoroller =
      NestedSideMenuController();
  final List<SideMenuItem> menuItems = [
    SideMenuItem(
      title: 'Intro',
      child: IntroPage(),
      subMenuList: [
        SideMenuItem(title: 'NestedSideMenuBar', child: SideMenuBarScreen())
      ],
    ),
    SideMenuItem(title: 'Projects', child: ProjectsScreen(), subMenuList: [
      SideMenuItem(title: '불꽃놀이', child: IntroPage(), subMenuList: [
        SideMenuItem(title: 'intro', child: IntroPage()), // 어떤 앱? 앱의 기능
        SideMenuItem(title: 'architecture', child: IntroPage()),
        SideMenuItem(title: '상태 관리', child: IntroPage()),
        SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
        SideMenuItem(title: '이슈', child: IntroPage()),
      ]),
      SideMenuItem(title: '당신의숲', child: IntroPage(), subMenuList: [
        SideMenuItem(title: 'intro', child: IntroPage()), // 어떤 앱? 앱의 기능
        SideMenuItem(title: 'architecture', child: IntroPage()),
        SideMenuItem(title: '상태 관리', child: IntroPage()),
        SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
        SideMenuItem(title: '이슈', child: IntroPage()),
      ]),
      SideMenuItem(title: '냠냠베어', child: IntroPage(), subMenuList: [
        SideMenuItem(title: 'intro', child: IntroPage()), // 어떤 앱? 앱의 기능
        SideMenuItem(title: 'architecture', child: IntroPage()),
        SideMenuItem(title: '상태 관리', child: IntroPage()),
        SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
        SideMenuItem(title: '이슈', child: IntroPage()),
      ]),
      SideMenuItem(title: '커피랭커', child: IntroPage(), subMenuList: [
        SideMenuItem(title: 'intro', child: IntroPage()), // 어떤 앱? 앱의 기능
        SideMenuItem(title: 'architecture', child: IntroPage()),
        SideMenuItem(title: '상태 관리', child: IntroPage()),
        SideMenuItem(title: '사용 라이브러리', child: IntroPage()),
        SideMenuItem(title: '이슈', child: IntroPage()),
      ]),
    ]),
    SideMenuItem(title: 'Contact', child: IntroPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 40, 71),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NestedSideMenuBar(
              controller: menubarContoroller,
              menuBarDepth: 0,
              initialIndex: 0,
              width: 130,
              innerPadding: EdgeInsets.fromLTRB(5, 5, 2, 5),
              outerPadding: EdgeInsets.fromLTRB(10, 10, 2, 10),
              color: Color.fromARGB(193, 1, 83, 150),
              fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily,
              menuItems: menuItems,
            ),
          ),
          Expanded(
            child: NestedSideMenuBody(
                controller: menubarContoroller, menuItems: menuItems),
          )
        ],
      ),
    );
  }
}

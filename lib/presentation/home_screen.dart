// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/components/side_menu_bar/side_menu_item.dart';
import 'package:web_portfolio/components/side_menu_bar/side_menu_bar_controller.dart';

import '../components/side_menu_bar/side_menu_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 40, 71),
      body: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Gap(50),
        SideMenuBar(
          controller: SideMenuBarController(),
          initialDepth: 0,
          initialIndex: 0,
          width: 100,
          innerPadding: EdgeInsets.fromLTRB(5, 5, 2, 5),
          outerPadding: EdgeInsets.fromLTRB(30, 30, 2, 10),
          color: Color.fromARGB(193, 1, 83, 150),
          fontFamily: GoogleFonts.ibmPlexSansKr().fontFamily,
          menuItems: [
            SideMenuItem(title: 'Intro'),
            SideMenuItem(title: 'Projects', subMenuList: [
              SideMenuItem(title: '불꽃놀이', subMenuList: [
                SideMenuItem(title: 'intro'), // 어떤 앱? 앱의 기능
                SideMenuItem(title: 'architecture'),
                SideMenuItem(title: '상태 관리'),
                SideMenuItem(title: '사용 라이브러리'),
                SideMenuItem(title: '이슈'),
              ]),
              SideMenuItem(title: '당신의숲', subMenuList: [
                SideMenuItem(title: 'intro'), // 어떤 앱? 앱의 기능
                SideMenuItem(title: 'architecture'),
                SideMenuItem(title: '상태 관리'),
                SideMenuItem(title: '사용 라이브러리'),
                SideMenuItem(title: '이슈'),
              ]),
              SideMenuItem(title: '냠냠베어', subMenuList: [
                SideMenuItem(title: 'intro'), // 어떤 앱? 앱의 기능
                SideMenuItem(title: 'architecture'),
                SideMenuItem(title: '상태 관리'),
                SideMenuItem(title: '사용 라이브러리'),
                SideMenuItem(title: '이슈'),
              ]),
              SideMenuItem(title: '커피랭커', subMenuList: [
                SideMenuItem(title: 'intro'), // 어떤 앱? 앱의 기능
                SideMenuItem(title: 'architecture'),
                SideMenuItem(title: '상태 관리'),
                SideMenuItem(title: '사용 라이브러리'),
                SideMenuItem(title: '이슈'),
              ]),
            ]),
            SideMenuItem(title: 'Contact'),
          ],
        ),
        // Expanded(child: Center(
        //   child:LayoutBuilder(builder: (context, constraints) {
        //     if(constraints.hasBoundedHeight ){}
        //   },),
        // ))
      ]),
    );
  }
}

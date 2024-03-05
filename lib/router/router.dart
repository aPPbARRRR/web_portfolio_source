import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_portfolio/web/presentation/common/view/intro_page.dart';
import 'package:web_portfolio/web/presentation/common/view/root_screen.dart';

import '../web/presentation/common/view/home_screen.dart';
import '../web/presentation/common/view/projects_screen.dart';
import 'routes.dart';
part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return _router;
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/intro',
      name: Routes.intro,
      builder: (context, state) => IntroPage(),
    ),
    GoRoute(
      path: '/projects',
      name: Routes.projects,
      builder: (context, state) => ProjectsScreen(),
    ),
    // GoRoute(
    //   path: '/contact',
    //   builder: (context, state) => ContactScreen(),
    // ),

    //++++++++++++++++++++++++++++++

    //   StatefulShellRoute.indexedStack(
    //       builder: (BuildContext context, GoRouterState state,
    //           StatefulNavigationShell navigationShell) {
    //         return RootScreen(navigationShell: navigationShell);
    //       },
    //       branches: [
    //         StatefulShellBranch(routes: [
    //           GoRoute(
    //             path: '/intro',
    //             name: Routes.intro,
    //             builder: (context, state) => IntroPage(),
    //           ),
    //         ]),
    //          StatefulShellBranch(routes: [
    //           GoRoute(
    //     path: '/projects',
    //     name: Routes.projects,
    //     builder: (context, state) => ProjectsScreen(),
    //   ),
    //         ]),
    //          StatefulShellBranch(routes: [
    //         GoRoute(
    //     path: '/contact',
    //     name: Routes.projects,
    //     builder: (context, state) => ProjectsScreen(),
    //   ),
    //         ])
    //       ],
    //       ),

    // +++++++++++++++++++++++++++++
  ],
);

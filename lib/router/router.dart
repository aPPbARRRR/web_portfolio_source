import 'package:go_router/go_router.dart';

import '../presentation/home_screen.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return _router;
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

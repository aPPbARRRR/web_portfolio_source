import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_portfolio/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

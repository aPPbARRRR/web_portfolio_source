import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/router/router.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(appRouterProvider);
    final TextTheme appTextTheme = GoogleFonts.ibmPlexSansKrTextTheme(
      Theme.of(context).textTheme,
    );

    return MaterialApp.router(
      theme: ThemeData(
        textTheme: appTextTheme,
      ),
      routerConfig: router,
    );
  }
}

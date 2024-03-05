import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/router/router.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
  // runApp(TestApp());
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

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Container(
//         //   color: Colors.orange,
//         // ),
//         // Container(
//         //   color: Colors.blue,
//         // ),
//         Expanded(child: MyHome(title: '1')),
//         // Expanded(child: MyHome(title: '2'))
//       ],
//     );
//   }
// }

// class MyHome extends StatelessWidget {
//   const MyHome({super.key, required this.title});

//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Center(
//           child: Column(children: [
//             TextButton(
//                 onPressed: () => Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => My1())),
//                 child: Text('1')),
//             TextButton(
//                 onPressed: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => My2())),
//                 child: Text('2')),
//             TextButton(
//                 onPressed: () => Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => My3())),
//                 child: Text('3')),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class My1 extends StatelessWidget {
//   const My1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('1'),
//     );
//   }
// }

// class My2 extends StatelessWidget {
//   const My2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('2'),
//     );
//   }
// }

// class My3 extends StatelessWidget {
//   const My3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('3'),
//     );
//   }
// }

// //// ----------
// class TestApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // 왼쪽 네비게이터
//           Flexible(
//             flex: 1,
//             child: Navigator(
//               key: GlobalKey<NavigatorState>(),
//               onGenerateRoute: (settings) {
//                 if (settings.name == '/') {
//                   return MaterialPageRoute(builder: (context) => LeftPanel());
//                 } else if (settings.name == '/leftPage1') {
//                   return MaterialPageRoute(builder: (context) => LeftPage1());
//                 }
//                 return null;
//               },
//             ),
//           ),
//           // 오른쪽 네비게이터
//           Flexible(
//             flex: 2,
//             child: Navigator(
//               key: GlobalKey<NavigatorState>(),
//               onGenerateRoute: (settings) {
//                 if (settings.name == '/') {
//                   return MaterialPageRoute(builder: (context) => RightPanel());
//                 } else if (settings.name == '/rightPage1') {
//                   return MaterialPageRoute(builder: (context) => RightPage1());
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LeftPanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: TextButton(
//         onPressed: () => Navigator.of(context).pushNamed('/leftPage1'),
//         child: Text('왼쪽 페이지 1로 이동'),
//       ),
//     );
//   }
// }

// class LeftPage1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("왼쪽 페이지 1")),
//       body: Center(child: Text("왼쪽 페이지 1")),
//     );
//   }
// }

// class RightPanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: TextButton(
//         onPressed: () => Navigator.of(context).pushNamed('/rightPage1'),
//         child: Text('오른쪽 페이지 1로 이동'),
//       ),
//     );
//   }
// }

// class RightPage1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("오른쪽 페이지 1")),
//       body: Center(child: Text("오른쪽 페이지 1")),
//     );
//   }
// }

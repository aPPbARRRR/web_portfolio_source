import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_portfolio/router/routes.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('프로젝트 스크린'),
          ElevatedButton(
              onPressed: () => context.pushNamed(Routes.intro),
              child: Text('routingTest')),
        ],
      ),
    );
  }
}

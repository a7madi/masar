import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/pages/create_travel_pages/create_travel_page.dart';
import 'package:masar/pages/home_page.dart';

const String rootPath = '/';
const String ctp = 'CreateTravelPage';

final goRoute = GoRouter(
  initialLocation: rootPath,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: rootPath,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: ctp,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const CreateTravelPage(),
          ),
        ),
      ],
    ),
  ],
);

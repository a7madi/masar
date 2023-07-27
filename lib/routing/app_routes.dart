import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/pages/create_travel_pages/create_travel_page.dart';
import 'package:masar/pages/home_page.dart';

const String rootPath = '/';

enum AppRouting { home, ctp }

final goRoute =
    GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
  GoRoute(path: '/', builder: (context, bstate) => const HomePage(), routes: [
    GoRoute(
      path: 'ctp',
      pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const CreateTravelPage(),
          fullscreenDialog: true),
    ),
  ]),
]);

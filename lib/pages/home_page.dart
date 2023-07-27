import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/app_routes.dart' as routing;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مـسـار'),
        centerTitle: true,
      ),
      body: Center(
          child: (TextButton(
              onPressed: () => context.go('/ctp'),
              // onPressed: () {
              //   Navigator.of(context).pushNamed(CreateTravelPage.routeName);
              // },
              child: const Text('أنشئ رحلة جديدة')))),
    );
  }
}

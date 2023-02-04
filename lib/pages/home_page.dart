import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مـسـار'),
      ),
      body: Center(
          child: (TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CreateTravelPage.routeName);
              },
              child: const Text('أنشئ رحلة جديدة')))),
    );
  }
}

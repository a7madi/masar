import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/create_travel_page.dart';
import '../provider/trip_details_provider.dart';
import 'package:provider/provider.dart';

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
              onPressed: () {
                final providerData =
                    Provider.of<TripDetailsProvider>(context, listen: false);
                providerData.initializeNewTrip();
                Navigator.of(context).pushNamed(CreateTravelPage.routeName);
              },
              child: const Text('أنشئ رحلة جديدة')))),
    );
  }
}

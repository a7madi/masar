import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/create_travel_page.dart';
import 'package:masar/pages/home_page.dart';
import 'package:masar/provider/trip_details_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TripDetailsProvider(),
      child: MaterialApp(
        title: 'Masarak - مسارك',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          CreateTravelPage.routeName: (_)=> const CreateTravelPage(),
        },
      ),
    );
  }
}

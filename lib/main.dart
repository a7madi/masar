import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_page.dart';
import 'package:masar/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masar',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        CreateTravelPage.routeName: (_)=>  CreateTravelPage(),
      },
    );
  }
}

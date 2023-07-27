import 'package:flutter/material.dart';
import 'package:masar/provider/trip_details_provider.dart';
import 'package:masar/routing/app_routes.dart' as r;
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TripDetailsProvider(),
      child: MaterialApp.router(
        routerConfig: r.goRoute,
        title: 'Masarak - مسارك',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

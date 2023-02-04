import 'package:flutter/material.dart';

class CreateTravelPage extends StatelessWidget {
  const CreateTravelPage({super.key});
  static const String routeName ='/create-new-travel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء رحلة جديدة'),
      ),
      body: const Center(
        child: Text('صفحة إن شاء رحلة جديدة'),
      ),
    );
  }
}

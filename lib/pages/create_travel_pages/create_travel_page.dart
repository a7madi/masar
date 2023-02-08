import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/company_form_pages.dart';
import 'package:masar/pages/create_travel_pages/trip_owner_form.dart';
import 'package:masar/pages/create_travel_pages/trip_schedule_page.dart';

class CreateTravelPage extends StatefulWidget {
  const CreateTravelPage({super.key});
  static const String routeName = '/create-new-travel';

  @override
  State<CreateTravelPage> createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends State<CreateTravelPage> {
  


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء رحلة جديدة'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(child: Text('منسق الرحلة'),),
            Tab(child: Text('جدول الرحلة'),),
            
            Tab(child: Text('بيانات الشركة'),),
          ]),
        ),
        body: TabBarView(children: <Widget>[ TripOwnerForm(),const TripScheduleForm(), CompanyFormPage(),]),
      ),
    );
  }
}

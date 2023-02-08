import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/company_form_pages.dart';
import 'package:masar/pages/create_travel_pages/trip_owner_form.dart';
import 'package:masar/pages/create_travel_pages/trip_schedule_page.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTravelPage extends StatefulWidget {
  const CreateTravelPage({super.key});
  static const String routeName = '/create-new-travel';

  @override
  State<CreateTravelPage> createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends State<CreateTravelPage> {
  

  var _pickedDate = '';

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

  Row _datePicker(BuildContext context) {
    final outlineborder = OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(4));
    return Row(
      children: [
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('اختر اليوم'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('اعتمد الوقت')),
                ],
                content: SizedBox(
                  height: 250,
                  width: 500,
                  child: SfDateRangePicker(
                    onSelectionChanged: (v) {
                      setState(() {
                        _pickedDate = v.value
                            .toString()
                            .substring(0, 10)
                            .replaceAll('-', '/');
                      });
                    },
                  ),
                ),
              ),
            );
          },
          child: const Text('اختر اليوم'),
        ),
        SizedBox(
            width: 160,
            height: 35,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: _pickedDate.isEmpty? 'لم يتم تحديد اليوم بعد':_pickedDate,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: outlineborder,
                  focusedBorder: outlineborder),
            )),
      ],
    );
  }

  Card _destinationCard() {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('نقطة التحميل: فندق مكة المكرمة'),
            // SizedBox(
            //   width: 2,
            // ),
            Text('الوجهة: مزارات مكة جعرانة')
          ],
        ),
        subtitle: const Text('التاريخ: 2023/02/11'),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }

  
}

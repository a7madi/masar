import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/widgets/form_text_field_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';

class TripScheduleForm extends StatefulWidget {
  const TripScheduleForm({super.key});

  @override
  State<TripScheduleForm> createState() => _TripScheduleFormState();
}

class _TripScheduleFormState extends State<TripScheduleForm> {
  var _pickedDate = '';
  final _formKey = GlobalKey<FormState>();
  final _txtCntPickupLocation = TextEditingController();
  final _txtCntDropLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TxtFormField(
                    textLable: 'نقطة التحميل', textController: _txtCntPickupLocation,maxInputDigits: 50,),
                TxtFormField(
                    textLable: 'نقطة التنزيل', textController: _txtCntDropLocation,maxInputDigits: 50,),
                    _dateTimePicker(),

                    TextButton(onPressed: (){}, child: const Text('أضف الوجهة')),
              ],
            ),
          )),
    );
  }

  Padding _dateTimePicker() {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateTimePicker(dateMask: 'd MMM, yyyy',
                    type: DateTimePickerType.dateTimeSeparate,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365),),
                      icon: const Icon(Icons.event),
                    dateLabelText: 'حدد اليوم',
                    dateHintText: 'حدد اليوم',
                    timeHintText: 'حدد الوقت',
                    onSaved: (value) => _pickedDate = value!,
                    ),
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

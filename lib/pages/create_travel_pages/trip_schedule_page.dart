import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/widgets/form_text_field_widget.dart';

class TripScheduleForm extends StatefulWidget {
  const TripScheduleForm({super.key});

  @override
  State<TripScheduleForm> createState() => _TripScheduleFormState();
}

class _TripScheduleFormState extends State<TripScheduleForm> {
  DateTime _date = DateTime.now();
  var _pickedDate = '';
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 0);
  final _txtCntDateTime = TextEditingController();
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
                  textLable: 'نقطة التحميل',
                  textController: _txtCntPickupLocation,
                  maxInputDigits: 50,
                ),
                TxtFormField(
                  textLable: 'نقطة التنزيل',
                  textController: _txtCntDropLocation,
                  maxInputDigits: 50,
                ),
                _dateTimePicker(),
                TextButton(onPressed: () {}, child: const Text('أضف الوجهة')),
              ],
            ),
          )),
    );
  }

  Widget _dateTimePicker() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Future.delayed(Duration.zero)
                .then((_) => _setDate())
                .then((_) => _setTime())
                .then(
                  (_) => _setPickedDate(),
                );
          },
          child: const Text('حدد التاريخ والوقت'),
        ),
        SizedBox(
          height: 80,
          width: 150,
          child: TextField(
            readOnly: true,
            controller: _txtCntDateTime,
          ),
        ),
      ],
    );
  }

  void _setTime() async {
    await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    ).then((value) {
      if (value == null) {
        return;
      }
      _time = value;
    });
  }

  void _setDate() async {
    var currentDate = DateTime.now();
    await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: currentDate.add(
        const Duration(days: 365),
      ),
    ).then((value) {
      if (value == null) return;
      _date = value;
    });
  }

  void _setPickedDate() {
    _pickedDate = '${(_time.hour > 9) ? _time.hour : '0' '${_time.hour}'}:${(_time.minute > 9) ? _time.minute : '0' '${_time.minute}'} - ${_date.toString().substring(0, 10).replaceAll('-', '/')}';

    setState(() {
      _txtCntDateTime.text = _pickedDate;
    });
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

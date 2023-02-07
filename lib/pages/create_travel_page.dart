import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTravelPage extends StatefulWidget {
  CreateTravelPage({super.key});
  static const String routeName = '/create-new-travel';

  @override
  State<CreateTravelPage> createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends State<CreateTravelPage> {
  final _formKey = GlobalKey<FormState>();

  // TravelCompanyName TextController.
  final _txtCntTrvlComp = TextEditingController();

  // TravelCompanyPhoneNumber TextController.
  final _txtCntTrvlCompP = TextEditingController();

  // TravelCompanyEmail TextController.
  final _txtCntTrvlCompE = TextEditingController();

  // TravelCompanyEmail TextController.
  final _txtNumBuses = TextEditingController();

  var _pickedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء رحلة جديدة'),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Text('بيانات الشركة'),
                _textField('شركة النقل', _txtCntTrvlComp),
                _textField('البريد الإلكتروني الخاص بالشركة', _txtCntTrvlCompP),
                _textField('رقم الجوال الخاص بالشركة', _txtCntTrvlCompE),
                _textField('عدد الحافلات', _txtNumBuses),
                _datePicker(context),
                _destinationCard(),
              ],
            ),
          ),
        ),
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

  TextFormField _textField(String textLable, TextEditingController textCont) {
    final outlineborder = OutlineInputBorder(
        borderSide: const BorderSide(width: 0.8),
        borderRadius: BorderRadius.circular(15));
    return TextFormField(
      controller: textCont,
      decoration: InputDecoration(
        labelText: textLable,
        enabledBorder: outlineborder,
        focusedBorder: outlineborder,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'لا يمكن ترك هذه الخانة خالية';
        }
        return null;
      },
    );
  }
}

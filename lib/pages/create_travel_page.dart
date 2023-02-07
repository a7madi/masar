import 'package:flutter/material.dart';

class CreateTravelPage extends StatelessWidget {
  CreateTravelPage({super.key});
  static const String routeName = '/create-new-travel';
  final _formKey = GlobalKey<FormState>();

  // TravelCompanyName TextController.
  final _txtCntTrvlComp = TextEditingController();

  // TravelCompanyPhoneNumber TextController.
  final _txtCntTrvlCompP = TextEditingController();

  // TravelCompanyEmail TextController.
  final _txtCntTrvlCompE = TextEditingController();

  // TravelCompanyEmail TextController.
  final _txtNumBuses = TextEditingController();

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
                  textField('شركة النقل', _txtCntTrvlComp),
                  textField(
                      'البريد الإلكتروني الخاص بالشركة', _txtCntTrvlCompP),
                  textField('رقم الجوال الخاص بالشركة', _txtCntTrvlCompE),
                  textField('عدد الحافلات', _txtNumBuses),
                  destinationCard(),
                ],
              ),
            ),
          ),
        ));
  }

  Card destinationCard() {
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
                   leading:  IconButton(onPressed: (){ },icon:const  Icon(Icons.delete,color: Colors.red,)),
                ),);
  }

  TextFormField textField(String textLable, TextEditingController textCont) {
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

import 'package:flutter/material.dart';

class CompanyFormPage extends StatelessWidget {
   CompanyFormPage({super.key});

   
  final _formKey = GlobalKey<FormState>();
  // TravelCompanyName TextController.
  final _txtCntTrvlComp = TextEditingController();

  // TravelCompanyPhoneNumber TextController.
  final _txtCntTrvlCompP = TextEditingController();

  // TravelCompanyEmail TextController.
  final _txtCntTrvlCompE = TextEditingController();

  // الكنترولر الخاص بعدد الحافلات.
  final _txtNumBuses = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ],
            ),
          ),
        ),
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
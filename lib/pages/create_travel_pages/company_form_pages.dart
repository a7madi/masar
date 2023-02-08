// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../model/transportation_company.dart' as tc;

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
                _textField('شركة النقل', _txtCntTrvlComp, isMandatory: true),
                _textField('البريد الإلكتروني الخاص بالشركة', _txtCntTrvlCompE,
                    isMail: true),
                _textField('رقم الجوال الخاص بالشركة', _txtCntTrvlCompP,
                    isPhone: true),
                _textField('عدد الحافلات', _txtNumBuses, isNum: true, isMandatory: true),
                TextButton(
                    onPressed: () {
                    _formKey.currentState!.validate();
                      var transportComp = tc.TCompany(
                          name: _txtCntTrvlComp.text,
                          email: _txtCntTrvlCompE.text,
                          phoneNumber: _txtCntTrvlCompP.text,
                          numberOfBuses: int.parse(_txtNumBuses.text));
                      print(transportComp.displayTransportationCompanyIndf());
                    },
                    child: const Text('حفظ بيانات شركة النقل'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(String textLable, TextEditingController textCont,
      {bool isNum = false, bool isMail = false, bool isPhone = false, isMandatory = false}) {
    final outlineborder = OutlineInputBorder(
        borderSide: const BorderSide(width: 0.8),
        borderRadius: BorderRadius.circular(15));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: isNum
            ? TextInputType.number
            : isMail
                ? TextInputType.emailAddress
                : isPhone
                    ? TextInputType.phone
                    : TextInputType.text,
        controller: textCont,
        decoration: InputDecoration(
          labelText: textLable,
          enabledBorder: outlineborder,
          focusedBorder: outlineborder,
        ),
        validator: (value) {
          if(!isMandatory) return null; 
          if (value == null || value.isEmpty) {
            return 'لا يمكن ترك هذه الخانة خالية';
          }
          return null;
        },
      ),
    );
  }
}

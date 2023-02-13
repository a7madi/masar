// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/widgets/form_text_field_widget.dart';
import '../../model/transportation_company.dart' as tc;

class CompanyFormPage extends StatelessWidget {
  CompanyFormPage({super.key});

  final _formKey = GlobalKey<FormState>();
  // TravelCompanyName TextController.
  final _txtCntTrvlComp = TextEditingController();

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
                TxtFormField(
                    textLable: 'شركة النقل',
                    textController: _txtCntTrvlComp,
                    isMandatoryField: true),
                TxtFormField(
                    textLable: 'عدد الحافلات',
                    textController: _txtNumBuses,
                    isNumKey: true,
                    isMandatoryField: true),
                TextButton(
                    onPressed: () {
                      var valid = _formKey.currentState!.validate();
                      if (!valid) {
                        return;
                      }
                      var transportComp = tc.TCompany(
                          name: _txtCntTrvlComp.text,
                          numberOfBuses: int.parse(_txtNumBuses.text));
                    },
                    child: const Text('حفظ بيانات شركة النقل'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:masar/pages/create_travel_pages/widgets/form_text_field_widget.dart';

class TripOwnerForm extends StatelessWidget {
  TripOwnerForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final _txtCntTripOwnerName = TextEditingController();
  final _txtCntTripOwnerPhone = TextEditingController();
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
                textLable: 'اسم المنسق',
                textController: _txtCntTripOwnerName,
                isMandatoryField: true,
              ),
              TxtFormField(
                textLable: 'رقم الجوال',
                textController: _txtCntTripOwnerPhone,
                isMandatoryField: true,
                isNumKey: true,
                isPhoneKey: true,
                maxInputDigits: 9,
              ),
              TextButton(
                  onPressed: () {
                    var valid = _formKey.currentState!.validate();
                    if (!valid) {
                      return;
                    }
                  },
                  child: const Text('حفظ بيانات المنسق'))
            ],
          ),
        ),
      ),
    );
  }
}

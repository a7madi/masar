import 'package:flutter/material.dart';
import 'package:masar/model/trip_owner.dart';
import 'package:masar/pages/create_travel_pages/widgets/form_text_field_widget.dart';
import 'package:masar/provider/trip_details_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/info_card_widget.dart';

class TripOwnerForm extends StatelessWidget {
  TripOwnerForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final _txtCntTripOwnerName = TextEditingController();
  final _txtCntTripOwnerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dP = Provider.of<TripDetailsProvider>(context, listen: true);
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
                    dP.setTripOwner(TripOwner(
                        name: _txtCntTripOwnerName.text,
                        phoneNumber: _txtCntTripOwnerPhone.text));
                  },
                  child: const Text('حفظ بيانات المنسق')),
              if (dP.currentTripOwner.name.isNotEmpty &&
                  dP.currentTripOwner.phoneNumber.isNotEmpty)
                InfoCard(
                  title1: 'اسم منسق الرحلة',
                  title2: 'رقم الجوال',
                    title1Value: dP.currentTripOwner.name,
                    title2Value: dP.currentTripOwner.phoneNumber,
                    onPressed: dP.resetTripOwner),
            ],
          ),
        ),
      ),
    );
  }
}



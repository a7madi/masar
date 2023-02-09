import 'package:flutter/material.dart';

class TxtFormField extends StatelessWidget {
  late final String _textLable;
  late final TextEditingController _textController;
  late final bool _isNumKey;
  late final bool _isMandatoryField;
  late final bool _isPhoneKey;
  late final int _maxInputDigits;
  TxtFormField(
      {super.key,
      required String textLable,
      required TextEditingController textController,
      bool isNumKey = false,
      bool isMailKey = false,
      bool isPhoneKey = false,
      bool isMandatoryField = false,
      int maxInputDigits = 20}) {
    _textLable = textLable;
    _textController = textController;
    _isNumKey = isNumKey;
    _isPhoneKey = isPhoneKey;
    _maxInputDigits = maxInputDigits;

    _isMandatoryField = isMandatoryField;
  }
  final _outlineborder = OutlineInputBorder(
      borderSide: const BorderSide(width: 0.8),
      borderRadius: BorderRadius.circular(15));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: _isNumKey ? TextInputType.number : TextInputType.text,
        controller: _textController,
        maxLength: _maxInputDigits,
        decoration: InputDecoration(
          labelText: _textLable,
          enabledBorder: _outlineborder,
          focusedBorder: _outlineborder,
        ),
        validator: (value) {
          int? length = value?.length;
          if (value == null || value.isEmpty && _isMandatoryField) {
            return 'لا يمكن ترك هذه الخانة خالية';
          }
          if (_isNumKey && isNAN(value)) {
            return _isPhoneKey? 'أدخل رقم جوال صحيح': 'أدخل عدد صحيح';
          }
          if (_isPhoneKey && (length! > 9 || length < 9)) {
            return 'رقم الجوال لا يمكن أن يكون أقل/أكثر من 9 أرقام';
          }
          if(_isPhoneKey && value[0]=='0'){
            return 'الرقم يجب أن يبدأ ب5 وليس 0';
          }
          return null;
        },
      ),
    );
  }
  bool isNAN(String txt) {
    try {
      int.parse(txt);
      return false;
    } catch (_) {
      return true;
    }
  }
}

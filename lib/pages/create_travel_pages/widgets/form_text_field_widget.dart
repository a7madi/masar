import 'package:flutter/material.dart';

class TxtFormField extends StatelessWidget {
  late final String _textLable;
  late final TextEditingController _textController;
  late final bool _isNumKey;
  late final bool _isMandatoryField;
  TxtFormField(
      {super.key,
      required String textLable,
      required TextEditingController textController,
      bool isNumKey = false,
      bool isMailKey = false,
      bool isPhoneKey = false,
      bool isMandatoryField = false}) {
    _textLable = textLable;
    _textController = textController;
    _isNumKey = isNumKey;

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
        decoration: InputDecoration(
          labelText: _textLable,
          enabledBorder: _outlineborder,
          focusedBorder: _outlineborder,
        ),
        validator: (value) {
          if (value == null || value.isEmpty && _isMandatoryField) {
            return 'لا يمكن ترك هذه الخانة خالية';
          }
          if (_isNumKey && isNAN(value)) {
            return 'أدخل عدد صحيح';
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

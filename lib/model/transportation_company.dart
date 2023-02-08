// ignore_for_file: avoid_print

class TCompany{
  /// Transportation Company
  late final String _name;
  late final String _email;
  late final String _phoneNumber;
    late int _numOfBuses; // the number of buses...

  TCompany({required String name, String email='', String phoneNumber='', required numberOfBuses}){
    _name = name;
    _email = email;
    _phoneNumber =phoneNumber;
    _numOfBuses = numberOfBuses;

  }
  String displayTransportationCompanyIndf(){
   return '''معلومات شركة النقل
    اسم الشركة: $_name
    البريد الإلكتروني: ${_email.isEmpty? 'البريد الإلكتروني غير مسجل': _email}
    رقم الجوال: ${_phoneNumber.isEmpty? 'رقم الهاتف غير مسجل': _phoneNumber}
    عدد الحافلات: $_numOfBuses
''';
  }
}
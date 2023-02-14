// ignore_for_file: avoid_print

class TCompany{
  /// Transportation Company
  late final String _name;

    late int _numOfBuses; // the number of buses...

  TCompany({required String name,required numberOfBuses}){
    _name = name;
    _numOfBuses = numberOfBuses;
  }
String get companyName{
  return _name;
}
int get numberOfBuses{
  return _numOfBuses;
}
}
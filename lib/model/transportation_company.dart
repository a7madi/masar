class TCompany {
  late final String _name;
  late final int _numOfBuses;

  TCompany({required String name, required numberOfBuses}) {
    _name = name;
    _numOfBuses = numberOfBuses;
  }
  String get companyName {
    return _name;
  }

  int get numberOfBuses {
    return _numOfBuses;
  }
}

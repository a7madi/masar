class TripOwner {
  late final String _name;
  late final String _phoneNumber;
  TripOwner({required String name, required String phoneNumber}) {
    _name = name;
    _phoneNumber = phoneNumber;
  }

  String get name {
    return _name;
  }

  String get phoneNumber {
    return _phoneNumber;
  }
}

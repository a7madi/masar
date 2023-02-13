// ignore_for_file: unused_field

class Destiniation{
  String _pickPoint='';
  String _dropPoint='';
  late DateTime _travelDate;

  Destiniation({required String pickPoint, required String dropPoint, required DateTime travelDate}){
    _pickPoint = pickPoint;
    _dropPoint = dropPoint;
    _travelDate = travelDate;
  }
  String get pickupLocation{
    return _pickPoint;
  }
  String get dropLocation{
    return _dropPoint;
  }
  DateTime get date{
    return _travelDate;
  }
}
// ignore_for_file: unused_field

class Destiniation{
  String _pickPoint='';
  String _dropPoint='';
  late DateTime _travelDate;
   String _desID = '';

  Destiniation({required String pickPoint, required String dropPoint, required DateTime travelDate, required String id}){
    _pickPoint = pickPoint;
    _dropPoint = dropPoint;
    _travelDate = travelDate;
    _desID = id;
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
  String get desID{
    return _desID;
  }
}
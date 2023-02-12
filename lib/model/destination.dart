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
  String getPickupLocation(){
    return _pickPoint;
  }
  String getDropLocation(){
    return _dropPoint;
  }
  DateTime getDate(){
    return _travelDate;
  }
}
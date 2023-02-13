// ignore_for_file: unused_field, prefer_final_fields

import 'package:masar/model/destination.dart';
import 'package:masar/model/transportation_company.dart';
import 'package:masar/model/trip_owner.dart';

enum TripStatus { complete, draft }

class Trip {
  List<Destiniation> _destinations = [];
  late TripOwner _tripOwner;
  late TCompany _tCompany;
  late String _tripNumber;
  late TripStatus _tripStatus;

  Trip({
    required TripOwner tripOwner,
    required TCompany tCompany,
    required List<Destiniation> destinations,
    TripStatus tripStatus = TripStatus.draft,
  }) {
    _tCompany = tCompany;
    _destinations = destinations;
    _tripOwner = tripOwner;
    _tripStatus = tripStatus;
    _tripNumber = DateTime.now()
        .toIso8601String(); // سيتم تغيير آلية إنشاء رقم الرحلة لاحقًا
  }

  void updateTripStatus(TripStatus newTripsStatus) {
    _tripStatus = newTripsStatus;
  }

  void addDestination(Destiniation destiniation) {
    _destinations.add(destiniation);
  }

  void removeDestinitaion(String desID) {
    _destinations.removeWhere((des) => des.desID == desID);
  }

  List<Destiniation> get destiniations {
    return [..._destinations];
  }

  TripOwner get tripOwner {
    return _tripOwner;
  }

  TCompany get tCompany {
    return _tCompany;
  }

  TripStatus get tripStatus {
    return _tripStatus;
  }

  String get tripNumber {
    return _tripNumber;
  }
}

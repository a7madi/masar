// ignore_for_file: unused_field, prefer_final_fields

import 'package:masar/model/destination.dart';
import 'package:masar/model/transportation_company.dart';
import 'package:masar/model/trip_owner.dart';
import 'dart:math';

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
    _tripNumber = _setTripNumber();
  }

  void updateTripStatus(TripStatus newTripsStatus) {
    _tripStatus = newTripsStatus;
  }

  String _setTripNumber() {
    const String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random random = Random();
    final first4Char = String.fromCharCodes(Iterable.generate(
        4, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
    final sect4Num = String.fromCharCodes(
        Iterable.generate(3, (_) => '0'.codeUnitAt(0) + random.nextInt(10)));
    return first4Char + sect4Num;
  }

  void addDestination(Destiniation destiniation) {
    _destinations.add(destiniation);
  }

  void removeDestinitaion(String desID) {
    _destinations.removeWhere((des) => des.desID == desID);
  }

  List<Destiniation> get destinations {
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

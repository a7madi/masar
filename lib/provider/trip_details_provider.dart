import 'package:flutter/material.dart';
import '../model/destination.dart';
import '../model/transportation_company.dart';
import '../model/trip.dart';
import '../model/trip_owner.dart';

class TripDetailsProvider with ChangeNotifier {
  final List<Trip> _tripsList = [];
  late Trip _newTrip;
  bool _isTripReady = false;
  bool _isTOReady = false;
  bool _isTCReady = false;
  bool _isTSReady = false;

  void initializeNewTrip() {
    _newTrip = Trip(
      tripStatus: TripStatus.draft,
      tripOwner: TripOwner(name: '', phoneNumber: ''),
      tCompany: TCompany(name: '', numberOfBuses: 0),
      destinations: <Destiniation>[],
    );
    _isTripReady = false;
    _isTOReady = false;
    _isTCReady = false;
    _isTSReady = false;
  }

  List<Destiniation> get currentTripDestiniations {
    return _newTrip.destiniations;
  }

  TripOwner get currentTripOwner {
    return _newTrip.tripOwner;
  }

  TCompany get currentTCompany {
    return _newTrip.tCompany;
  }
Trip get trip{
  return _newTrip;
}
  void setTripOwner(TripOwner tripOwner) {
    _newTrip = Trip(
      tripOwner: tripOwner,
      tCompany: _newTrip.tCompany,
      destinations: _newTrip.destiniations,
    );
    notifyListeners();
  }

  void addDestination(Destiniation destination) {
    _newTrip.addDestination(destination);
    _isTSReady = true;
    updateIfTripReady();
    notifyListeners();
  }

  void removeDestinitaion(String desID) {
    _newTrip.removeDestinitaion(desID);
    if (_newTrip.destiniations.isEmpty) _isTSReady = false;
    updateIfTripReady();
    notifyListeners();
  }

  void updateIfTripReady() {
    if (_isTCReady && _isTOReady && _isTSReady) {
      _isTripReady = true;
    }
    _isTripReady = false;
  }

  bool get isTripReady {
    return _isTripReady;
  }

  void resetTripOwner() {
    _newTrip = Trip(
      tripOwner: TripOwner(name: '', phoneNumber: ''),
      tCompany: _newTrip.tCompany,
      destinations: _newTrip.destiniations,
    );
    _isTOReady = false;
    updateIfTripReady();
    notifyListeners();
  }

  void resetTCompany() {
    _newTrip = Trip(
      tripOwner: _newTrip.tripOwner,
      tCompany: TCompany(name: '', numberOfBuses: 0),
      destinations: _newTrip.destiniations,
    );
    _isTCReady = false;
    updateIfTripReady();
    notifyListeners();
  }

  void setTransportCompany(TCompany tCompany) {
    _newTrip = Trip(
      tripOwner: _newTrip.tripOwner,
      tCompany: tCompany,
      destinations: _newTrip.destiniations,
    );
    _isTCReady = true;
    updateIfTripReady();
    notifyListeners();
  }

  void addNewTripToTrips() {
    _newTrip.updateTripStatus(TripStatus.complete);
    _tripsList.add(_newTrip);
  }

  List<Trip> get trips {
    return [..._tripsList];
  }
}

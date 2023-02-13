import 'package:flutter/material.dart';
import '../model/destination.dart';
import '../model/transportation_company.dart';
import '../model/trip.dart';
import '../model/trip_owner.dart';

class TripDetailsProvider with ChangeNotifier {
  final List<Trip> _tripsList = [];
  late Trip _newTrip;

  void initializeNewTrip() {
    _newTrip = Trip(
      tripStatus: TripStatus.draft,
      tripOwner: TripOwner(name: '', phoneNumber: ''),
      tCompany: TCompany(name: '', numberOfBuses: 0),
      destinations: <Destiniation>[],
    );
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
    notifyListeners();
  }

  void removeDestinitaion(String desID) {
    _newTrip.removeDestinitaion(desID);
    notifyListeners();
  }

  void setTransportCompany(TCompany tCompany) {
    _newTrip = Trip(
      tripOwner: _newTrip.tripOwner,
      tCompany: tCompany,
      destinations: _newTrip.destiniations,
    );
    notifyListeners();
  }

  void addNewTripToTrips(Trip newTrip) {
    newTrip.updateTripStatus(TripStatus.complete);
    _tripsList.add(newTrip);
    notifyListeners();
  }

  List<Trip> get trips {
    return [..._tripsList];
  }
}

// ignore_for_file: unused_field, prefer_final_fields

import 'package:masar/model/destination.dart';
import 'package:masar/model/transportation_company.dart';
import 'package:masar/model/trip_owner.dart';

enum TripStatus { onging, finished, draft }

class Trip {
  List<Destiniation> _tripList = [];
  late TripOwner _tripOwner;
  late TCompany _tCompany;
  late String _tripNumber;
  late TripStatus _tripStatus;

  Trip({
    required TripOwner tripOnwer,
    required TCompany tCompany,
    required List<Destiniation> tripList,
    TripStatus tripStatus =TripStatus.draft,
  }) {
    _tCompany = tCompany;
    _tripList = tripList;
    _tripOwner = tripOnwer;
    _tripStatus = tripStatus;
    _tripNumber = DateTime.now().toIso8601String(); // سيتم تغيير آلية إنشاء رقم الرحلة لاحقًا
  }
}

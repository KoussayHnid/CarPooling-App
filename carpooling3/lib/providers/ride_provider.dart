import 'package:flutter/foundation.dart';

class RideProvider extends ChangeNotifier {
  String _rideStatus = 'Not Started';

  String get rideStatus => _rideStatus;

  void updateRideStatus(String status) {
    _rideStatus = status;
    notifyListeners();
  }
}

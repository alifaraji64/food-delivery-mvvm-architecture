import 'package:flutter/cupertino.dart';

class GlobalViewModel extends ChangeNotifier {
  //the initial set of latitude and longitude is done by the Maps.dart in services but when we open the map page we are changing it from the MapScreenViewModel
  String location;
  double latitude;
  double longitude;
  String get getLocation => location;
  double get getLatitude => latitude;
  double get getLongitude => longitude;

  setAddressInfo(double latitude, double longitude, String address) {
    this.latitude = latitude;
    this.longitude = longitude;
    this.location = address;
    notifyListeners();
  }
}

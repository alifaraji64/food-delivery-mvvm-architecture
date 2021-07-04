import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;

class Maps {
  double latitude;
  double longitude;
  String location;

  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cords =
        geoCo.Coordinates(positionData.latitude, positionData.longitude);
    this.latitude = positionData.latitude;
    this.longitude = positionData.longitude;
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);

    this.location = address.first.addressLine;
    return this.location.toString();
  }
}

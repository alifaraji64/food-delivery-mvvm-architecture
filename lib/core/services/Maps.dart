import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:pizzato_mvvm/core/viewmodels/GlobalViewModel.dart';
import 'package:provider/provider.dart';

class Maps {
  String location;

  Future getCurrentLocation(BuildContext context) async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();

    final cords =
        geoCo.Coordinates(positionData.latitude, positionData.longitude);

    Provider.of<GlobalViewModel>(context, listen: false).latitude =
        positionData.latitude;

    Provider.of<GlobalViewModel>(context, listen: false).longitude =
        positionData.longitude;

    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);

    this.location = address.first.addressLine;
    Provider.of<GlobalViewModel>(context, listen: false).setLocation(location);
  }
}

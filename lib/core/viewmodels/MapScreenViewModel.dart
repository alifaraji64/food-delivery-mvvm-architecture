import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:pizzato_mvvm/core/viewmodels/GlobalViewModel.dart';
import 'package:provider/provider.dart';

class MapScreenViewModel extends ChangeNotifier {
  void setLocationAndLat(
      BuildContext context, double latitude, double longitude) async {
    final cords = geoCo.Coordinates(latitude, longitude);
    List<geoCo.Address> address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
    //changing the user location in press to another location
    Provider.of<GlobalViewModel>(context, listen: false)
        .setAddressInfo(latitude, longitude, address.first.addressLine);
  }
}

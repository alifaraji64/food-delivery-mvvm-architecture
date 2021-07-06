import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pizzato_mvvm/core/viewmodels/GlobalViewModel.dart';
import 'package:pizzato_mvvm/core/viewmodels/MapScreenViewModel.dart';
import 'package:provider/provider.dart';

class MapScreenHelper extends ChangeNotifier {
  Widget fetchMap(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(
          Provider.of<GlobalViewModel>(context, listen: false).getLatitude,
          Provider.of<GlobalViewModel>(context, listen: false).getLongitude,
        ),
        zoom: 3.0,
        onTap: (position) async {
          Provider.of<MapScreenViewModel>(context, listen: false)
              .setLocationAndLat(
            context,
            position.latitude,
            position.longitude,
          );
        },
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: FlutterConfig.get('map_url_template'),
            additionalOptions: {
              'accessToken': FlutterConfig.get('map_access_token'),
              'id': FlutterConfig.get('map_id')
            }),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 10.0,
              height: 10.0,
              point: LatLng(
                Provider.of<GlobalViewModel>(context, listen: true).getLatitude,
                Provider.of<GlobalViewModel>(context, listen: true)
                    .getLongitude,
              ),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

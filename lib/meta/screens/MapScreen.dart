import 'package:flutter/material.dart';
import 'package:pizzato_mvvm/app/routes.dart';
import 'package:pizzato_mvvm/meta/helpers/MapScreen/MapScreenHelper.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Provider.of<MapScreenHelper>(context, listen: false).fetchMap(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check, color: Colors.white),
        onPressed: () {
          Routes.sailor.pop();
          Routes.sailor.pop();
        },
      ),
    );
  }
}

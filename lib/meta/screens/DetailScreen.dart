import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizzato_mvvm/core/models/Food.dart';
import 'package:pizzato_mvvm/meta/helpers/DetailScreen/DetailScreenHelper.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Food food = Sailor.param<Food>(context, 'food');
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Provider.of<DetailScreenHelper>(context, listen: false).buttons(
        context,
        food.name,
        food.image,
        food.price.toString(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('af'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.trash,
              color: Colors.redAccent,
            ),
            onPressed: () {
              //Provider.of<Calculations>(context, listen: false).removeAllData();
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Provider.of<DetailScreenHelper>(context, listen: false)
                .pizzaImage(food.image),
            Provider.of<DetailScreenHelper>(context, listen: false).middleData(
              food.name,
              food.rating.toString(),
              food.price.toString(),
            ),
            SizedBox(height: 10),
            Provider.of<DetailScreenHelper>(context, listen: false)
                .selectDetailBox(context)
          ],
        ),
      ),
    );
  }
}

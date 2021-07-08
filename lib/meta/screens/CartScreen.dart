import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizzato_mvvm/core/viewmodels/CartScreenViewModel.dart';
import 'package:pizzato_mvvm/meta/helpers/CartScreen/CartScreenHelper.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future myFuture;
  void initState() {
    super.initState();
    myFuture = Provider.of<CartScreenViewModel>(context, listen: false)
        .getCartItems(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.trash,
              color: Colors.redAccent,
            ),
            onPressed: () {},
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
            Provider.of<CartScreenHelper>(context, listen: false)
                .headerText(context),
            Provider.of<CartScreenHelper>(context, listen: false)
                .cartData(context, myFuture),
            SizedBox(height: 20),
            Provider.of<CartScreenHelper>(context, listen: false)
                .subTotalBox(context),
          ],
        ),
      ),
    );
  }
}

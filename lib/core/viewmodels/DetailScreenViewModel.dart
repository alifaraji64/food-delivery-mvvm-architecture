// ignore: non_constant_identifier_names
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizzato_mvvm/app/routes.dart';
import 'package:pizzato_mvvm/core/services/FirebaseOperations.dart';
import 'package:pizzato_mvvm/core/services/Maps.dart';
import 'package:pizzato_mvvm/core/viewmodels/GlobalViewModel.dart';
import 'package:provider/provider.dart';

class DetailScreenViewModel extends ChangeNotifier {
  //Maps maps = Maps();
  FirebaseOperations firebaseOperations = FirebaseOperations();
  int cheseValue = 0, beaconValue = 0, onionValue = 0;
  String size;
  double totalPrice = 0;
  List<double> orderPrices = [];
  List<QueryDocumentSnapshot> orders = [];
  int get getCheeseValue => cheseValue;
  int get getBeaconValue => beaconValue;
  int get getOnionValue => onionValue;
  double get getTotalPrice => totalPrice;
  String get getSize => size;
  List<double> get getOrderPrices => orderPrices;

  void deleteCheese() {
    if (cheseValue > 0) {
      cheseValue--;
      notifyListeners();
    }
  }

  void deleteBeacon() {
    if (beaconValue > 0) {
      beaconValue--;
      notifyListeners();
    }
  }

  void deleteOnion() {
    if (onionValue > 0) {
      onionValue--;
      notifyListeners();
    }
  }

  void addCheese() {
    cheseValue++;
    notifyListeners();
  }

  void addBeacon() {
    beaconValue++;
    notifyListeners();
  }

  void addOnion() {
    onionValue++;
    notifyListeners();
  }

  void smallTapped() {
    size = 'S';
    notifyListeners();
  }

  void mediumTapped() {
    size = 'M';
    notifyListeners();
  }

  void largeTapped() {
    size = 'L';
    notifyListeners();
  }

  void removeAllData() {
    cheseValue = 0;
    beaconValue = 0;
    onionValue = 0;
    size = null;
    notifyListeners();
  }

  addToCart(
      BuildContext context, String name, String image, String price) async {
    //print(Provider.of<GlobalViewModel>(context, listen: false).location);
    if (size != null) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'is this your location?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              content: Text(
                Provider.of<GlobalViewModel>(context, listen: true).getLocation,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                MaterialButton(
                    color: Colors.redAccent,
                    child: Text('No, I wanna edit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      notifyListeners();
                      Routes.sailor.navigate('/map_screen');
                    }),
                MaterialButton(
                    color: Colors.blue[700],
                    child: Text('Yes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    onPressed: () async {
                      try {
                        await firebaseOperations.submitOrder({
                          'name': name,
                          'image': image,
                          'price': price,
                          'cheese': this.getCheeseValue,
                          'beacon': this.getBeaconValue,
                          'onion': this.getOnionValue,
                          'size': this.getSize,
                          'address': Provider.of<GlobalViewModel>(context,
                                  listen: false)
                              .getLocation,
                          'time': Timestamp.now()
                        });
                        Navigator.pop(context);
                        this.removeAllData();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green[600],
                            duration: Duration(milliseconds: 2000),
                            content: Text(
                              'item successfully added to your cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                        notifyListeners();
                      } catch (e) {
                        print(e);
                      }
                    }),
              ],
            );
          });
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
          content: Text(
            'please select the size',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  subtotalForEachOrder() {
    print('puahaha');
    this.orders.forEach((order) {
      var data = order.data() as dynamic;
      print(data['price']);
      double price = double.parse(data['price']);
      //apply size to the price
      switch (data['size']) {
        case 'S':
          price++;
          break;
        case 'M':
          price += 2;
          break;
        case 'L':
          price += 3;
          break;
        default:
      }
      //apply gradients to the price
      if (data['cheese'] != 0) {
        price += data['cheese'];
      }
      if (data['beacon'] != 0) {
        price += data['beacon'];
      }
      if (data['onion'] != 0) {
        price += data['onion'];
      }
      orderPrices.add(price);
      this.totalPrice += price;

      //notifyListeners();
    });
    notifyListeners();
    print(totalPrice.toString());
    print(this.getOrderPrices);
  }

  clear() {
    this.orderPrices = [];
    this.totalPrice = 0;
    var _timer = new Timer(const Duration(milliseconds: 1), () {
      notifyListeners();
    });
    _timer.cancel();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizzato_mvvm/core/services/FirebaseOperations.dart';

class CartScreenViewModel extends ChangeNotifier {
  FirebaseOperations firebaseOperations = FirebaseOperations();
  double totalPrice = 0;
  List<double> orderPrices = [];
  List<QueryDocumentSnapshot> orders = [];
  List<double> get getOrderPrices => orderPrices;
  double get getTotalPrice => totalPrice;
  getCartItems(BuildContext context) {
    return firebaseOperations.getCartItems(context);
  }

  subtotalForEachOrder() {
    this.orders.forEach((order) {
      var data = order.data() as dynamic;
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
  }
}

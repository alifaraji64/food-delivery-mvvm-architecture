import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizzato_mvvm/core/services/FirebaseOperations.dart';
import 'package:pizzato_mvvm/core/services/Maps.dart';

class HomeScreenViewModel extends ChangeNotifier {
  FirebaseOperations firebaseOperations = FirebaseOperations();
  Maps maps = Maps();
  List<QueryDocumentSnapshot<Object>> items;
  List<QueryDocumentSnapshot<Object>> businessItems;
  String location;

  Future<List<QueryDocumentSnapshot<Object>>> fetchData(
      BuildContext context, String collection,
      [String foodType]) async {
    if (collection == 'favourite') {
      this.items = null;
      if (foodType != 'allFood') {
        this.items =
            await firebaseOperations.fetchData(context, collection, foodType);
        notifyListeners();
        return this.items;
      }

      this.items = await firebaseOperations.fetchData(context, collection);
      notifyListeners();
      return this.items;
    } else if (collection == 'business') {
      print(this.businessItems);
      this.businessItems =
          await firebaseOperations.fetchData(context, collection);
      return this.businessItems;
    }
  }

  Future getCurrentLocation() async {
    this.location = await maps.getCurrentLocation();
    notifyListeners();
  }
}

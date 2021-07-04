import 'package:flutter/cupertino.dart';
import 'package:pizzato_mvvm/core/services/FirebaseOperations.dart';

class LoginScreenViewModel extends ChangeNotifier {
  FirebaseOperations firebaseOperations = FirebaseOperations();
  Future logInViaGoogle() async {
    await firebaseOperations.logInViaGoogle();
    print('hello from login vm');
  }
}

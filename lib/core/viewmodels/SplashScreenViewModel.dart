import 'package:flutter/cupertino.dart';
import 'package:pizzato_mvvm/core/services/Authentication.dart';

class SplashScreenViewModel extends ChangeNotifier {
  Authentication authentication = Authentication();
  isAuthenticated() async {
    return await authentication.isAuthenticated();
  }
}

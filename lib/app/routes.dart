import 'package:pizzato_mvvm/core/models/Food.dart';
import 'package:pizzato_mvvm/meta/screens/DetailScreen.dart';
import 'package:pizzato_mvvm/meta/screens/HomeScreen.dart';
import 'package:pizzato_mvvm/meta/screens/LoginScreen.dart';
import 'package:pizzato_mvvm/meta/screens/MapScreen.dart';
import 'package:pizzato_mvvm/meta/screens/SplashScreen.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    SailorOptions(
      defaultTransitions: [SailorTransition.fade_in],
      defaultTransitionDuration: Duration(milliseconds: 500),
    );
    sailor.addRoutes([
      SailorRoute(
        name: '/splash_screen',
        builder: (context, args, params) => SplashScreen(),
      ),
      SailorRoute(
        name: '/login_screen',
        builder: (context, args, params) => LoginScreen(),
      ),
      SailorRoute(
        name: '/home_screen',
        builder: (context, args, params) => HomeScreen(),
      ),
      SailorRoute(
          name: '/detail_screen',
          builder: (context, args, params) => DetailScreen(),
          params: [
            SailorParam<Food>(
              name: 'food',
            ),
          ]),
      SailorRoute(
        name: '/map_screen',
        builder: (context, args, params) => MapScreen(),
        params: [],
      ),
    ]);
  }
}

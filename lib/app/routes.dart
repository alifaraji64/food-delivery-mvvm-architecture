import 'package:pizzato_mvvm/meta/screens/HomeScreen.dart';
import 'package:pizzato_mvvm/meta/screens/LoginScreen.dart';
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
    ]);
  }
}

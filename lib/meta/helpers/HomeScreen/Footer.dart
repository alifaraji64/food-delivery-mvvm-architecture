import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pizzato_mvvm/app/routes.dart';

class Footer extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Routes.sailor.navigate('/cart_screen');
        //print(FlutterConfig.get('test'));
        // Navigator.push(
        //     context,
        //     PageTransition(
        //       child: CartScreen(),
        //       type: PageTransitionType.fade,
        //     ));
      },
      child: Icon(
        EvaIcons.shoppingBag,
        color: Colors.white,
      ),
    );
  }
}

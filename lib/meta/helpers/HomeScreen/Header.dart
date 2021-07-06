import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizzato_mvvm/core/viewmodels/GlobalViewModel.dart';
import 'package:pizzato_mvvm/core/viewmodels/HomeScreenViewModel.dart';
import 'package:provider/provider.dart';

class Header extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  Widget appBar(BuildContext context) {
    if (Provider.of<GlobalViewModel>(context, listen: false).getLocation ==
        null)
      Provider.of<HomeScreenViewModel>(context, listen: false)
          .getCurrentLocation(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            icon: Icon(
              EvaIcons.logOut,
              size: 30,
            ),
            onPressed: () async {
              await storage.delete(key: 'uid');
              // Navigator.pushReplacement(
              //   context,
              //   PageTransition(
              //     child: Login(),
              //     type: PageTransitionType.fade,
              //   ),
              // );
            }),
        Row(
          children: [
            Icon(FontAwesomeIcons.locationArrow),
            SizedBox(width: 5),
            Container(
              constraints: BoxConstraints(maxWidth: 240),
              child: Text(
                '${Provider.of<GlobalViewModel>(context, listen: true).getLocation ?? "finding your location..."}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            )
          ],
        ),
        IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {})
      ],
    );
  }

  Widget headerText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'What would you like \n',
        style: TextStyle(color: Colors.grey[850], fontSize: 30),
        children: [
          TextSpan(
            text: 'to eat?',
            style: TextStyle(
              fontSize: 45,
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async {
            await Provider.of<HomeScreenViewModel>(context, listen: false)
                .fetchData(context, 'favourite', 'allFood');
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent,
                  blurRadius: 12,
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: Center(
                child: Text(
              'All Food',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await Provider.of<HomeScreenViewModel>(context, listen: false)
                .fetchData(context, 'favourite', 'pasta');
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent,
                  blurRadius: 12,
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: Center(
                child: Text(
              'Pasta',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await Provider.of<HomeScreenViewModel>(context, listen: false)
                .fetchData(context, 'favourite', 'pizza');
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent,
                  blurRadius: 12,
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            child: Center(
                child: Text(
              'Pizza',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizzato_mvvm/core/viewmodels/LoginScreenViewModel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: 'Piz',
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                TextSpan(
                  text: 'z',
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                TextSpan(
                  text: 'ato',
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ])),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    await Provider.of<LoginScreenViewModel>(context,
                            listen: false)
                        .logInViaGoogle();
                    // try {
                    //   await Provider.of<Authentication>(context, listen: false)
                    //       .signInWithGoogle();
                    //   Navigator.pushReplacement(
                    //       context,
                    //       PageTransition(
                    //           child: HomeScreen(),
                    //           type: PageTransitionType.fade));
                    // } catch (e) {
                    //   print('e');
                    //   print(e);
                    // }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google, color: Colors.white),
                      SizedBox(width: 5),
                      Text('sign in with google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

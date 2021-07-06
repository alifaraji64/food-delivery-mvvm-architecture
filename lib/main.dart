import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:pizzato_mvvm/app/routes.dart';
import 'package:pizzato_mvvm/core/services/Authentication.dart';
import 'package:pizzato_mvvm/core/viewmodels/DetailScreenViewModel.dart';
import 'package:pizzato_mvvm/core/viewmodels/GlobalViewModel.dart';
import 'package:pizzato_mvvm/core/viewmodels/HomeScreenViewModel.dart';
import 'package:pizzato_mvvm/core/viewmodels/MapScreenViewModel.dart';
import 'package:pizzato_mvvm/meta/helpers/DetailScreen/DetailScreenHelper.dart';
import 'package:pizzato_mvvm/meta/helpers/HomeScreen/Footer.dart';
import 'package:pizzato_mvvm/meta/helpers/HomeScreen/Header.dart';
import 'package:pizzato_mvvm/meta/helpers/HomeScreen/Middle.dart';
import 'package:pizzato_mvvm/meta/helpers/MapScreen/MapScreenHelper.dart';
import 'package:pizzato_mvvm/meta/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/LoginScreenViewModel.dart';
import 'core/viewmodels/SplashScreenViewModel.dart';

void main() async {
  Routes.createRoutes();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapScreenHelper()),
        ChangeNotifierProvider(create: (_) => LoginScreenViewModel()),
        ChangeNotifierProvider(create: (_) => Footer()),
        ChangeNotifierProvider(create: (_) => Header()),
        ChangeNotifierProvider(create: (_) => Middle()),
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => SplashScreenViewModel()),
        ChangeNotifierProvider(create: (_) => DetailScreenHelper()),
        ChangeNotifierProvider(create: (_) => DetailScreenViewModel()),
        ChangeNotifierProvider(create: (_) => GlobalViewModel()),
        ChangeNotifierProvider(create: (_) => MapScreenViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(),
        navigatorKey: Routes.sailor.navigatorKey, // important
        onGenerateRoute: Routes.sailor.generator(),
      ),
    );
  }
}

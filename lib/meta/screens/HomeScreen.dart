import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizzato_mvvm/core/viewmodels/HomeScreenViewModel.dart';
import 'package:pizzato_mvvm/meta/helpers/HomeScreen/Footer.dart';
import 'package:pizzato_mvvm/meta/helpers/HomeScreen/Header.dart';
import 'package:pizzato_mvvm/meta/helpers/HomeScreen/Middle.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AsyncMemoizer _memoizer;
  Future _businessFuture;

  @override
  void initState() {
    //Provider.of<Maps>(context, listen: false).getCurrentLocation();
    super.initState();
    _memoizer = AsyncMemoizer();
    _businessFuture = Provider.of<HomeScreenViewModel>(context, listen: false)
        .fetchData(context, 'business');
  }

  Future<List<QueryDocumentSnapshot<Object>>> _fetchData() async {
    await this._memoizer.runOnce(() async {
      return Provider.of<HomeScreenViewModel>(context, listen: false)
          .fetchData(context, 'favourite', 'allFood');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Provider.of<Footer>(context, listen: false)
            .floatingActionButton(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Provider.of<Header>(context, listen: false).appBar(context),
                SizedBox(height: 20),
                Provider.of<Header>(context, listen: false).headerText(context),
                SizedBox(height: 20),
                Provider.of<Header>(context, listen: false).appBarMenu(context),
                SizedBox(height: 20),
                Provider.of<Middle>(context, listen: false).textFav(),
                SizedBox(height: 10),
                Provider.of<Middle>(context, listen: false)
                    .datafav(context, _fetchData()),
                SizedBox(height: 20),
                Provider.of<Middle>(context, listen: false).textBusiness(),
                SizedBox(height: 10),
                Provider.of<Middle>(context, listen: false)
                    .dataBusiness(context, _businessFuture),
              ],
            ),
          ),
        ));
  }
}

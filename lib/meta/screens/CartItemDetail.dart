import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sailor/sailor.dart';

class CartItemDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QueryDocumentSnapshot snapshot =
        Sailor.param<QueryDocumentSnapshot>(context, 'snapshot');
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width * 0.85,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      snapshot.get('image'),
                      width: 150,
                    ),
                    Text(
                      snapshot.get('name'),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[850]),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent,
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Address  ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[850])),
                            Icon(FontAwesomeIcons.locationArrow)
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          snapshot.get('address'),
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[850]),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Order Time  ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[850])),
                            Icon(FontAwesomeIcons.clock)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot
                              .get('time')
                              .toDate()
                              .toString()
                              .substring(11, 19),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[850],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent,
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Onion',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[850]),
                            ),
                            Text(
                              'Beacon',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[850]),
                            ),
                            Text(
                              'Cheese',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[850]),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${snapshot.get('onion')}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[850]),
                            ),
                            Text(
                              '${snapshot.get('beacon')}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[850]),
                            ),
                            Text(
                              '${snapshot.get('cheese')}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[850]),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              snapshot.get('onion') > 0
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                              snapshot.get('beacon') > 0
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                              snapshot.get('cheese') > 0
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                            ])
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

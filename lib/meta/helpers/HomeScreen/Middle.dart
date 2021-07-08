import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizzato_mvvm/app/routes.dart';
import 'package:pizzato_mvvm/core/models/Food.dart';
import 'package:pizzato_mvvm/core/viewmodels/HomeScreenViewModel.dart';
import 'package:provider/provider.dart';

class Middle extends ChangeNotifier {
  Widget textFav() {
    return RichText(
      text: TextSpan(
        text: 'Favourite',
        style: TextStyle(color: Colors.grey[900], fontSize: 45, shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          )
        ]),
        children: [
          TextSpan(
            text: ' dishes',
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget datafav(BuildContext context, Future _future) {
    //futureProvider will rebuild itself whenever the notifyListeners() called from fetchData
    //fetchData can only be called from homeScreen(initState) and header when tapped to the Item name
    return Container(
        height: 300.0,
        child: FutureProvider<List<QueryDocumentSnapshot<Object>>>(
          // ignore: missing_return
          catchError: (_, __) {},
          initialData: null,
          create: (_) => _future,
          child: Consumer<HomeScreenViewModel>(
            builder: (_, instance, __) {
              if (instance.items == null) {
                print(instance.items);
                return Center(
                  child: Lottie.asset('animations/delivery.json'),
                );
              }
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      Provider.of<HomeScreenViewModel>(context, listen: false)
                          .items
                          .map((DocumentSnapshot documentSnapshot) {
                    return GestureDetector(
                      onTap: () {
                        Routes.sailor.navigate<Food>('/detail_screen', params: {
                          'food': Food(
                            name: documentSnapshot.get('name'),
                            category: documentSnapshot.get('category'),
                            image: documentSnapshot.get('image'),
                            rating: documentSnapshot.get('rating').toString(),
                            price: documentSnapshot.get('price').toString(),
                          ),
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular((40)),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]),
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 180,
                                    width: 180,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        documentSnapshot.get('image'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: 142,
                                      child: IconButton(
                                        icon: Icon(
                                          EvaIcons.heart,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          //notifyListeners();
                                        },
                                      ))
                                ],
                              ),
                              Text(
                                documentSnapshot.get('name'),
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 3),
                              Text(
                                documentSnapshot.get('category'),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          '  ' +
                                              documentSnapshot
                                                  .get('rating')
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\$ " +
                                          '${documentSnapshot.get("price").toString()}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList());
            },
          ),
        ));
  }

  Widget textBusiness() {
    return RichText(
      text: TextSpan(
        text: 'business',
        style: TextStyle(color: Colors.grey[900], fontSize: 45, shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          )
        ]),
        children: [
          TextSpan(
            text: ' lunch',
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget dataBusiness(BuildContext context, Future _businessFuture) {
    return Container(
      height: 400,
      child: FutureBuilder(
        future: _businessFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('animations/delivery.json'),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular((40)),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                snapshot.data[index].data()['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data[index].data()['category'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                              Text(
                                "\$ " +
                                    snapshot.data[index]
                                        .data()['notprice']
                                        .toString(),
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.amber,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$ " +
                                    snapshot.data[index]
                                        .data()['price']
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                  snapshot.data[index].data()['image']),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

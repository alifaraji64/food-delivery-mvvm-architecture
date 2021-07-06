import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pizzato_mvvm/core/viewmodels/DetailScreenViewModel.dart';
import 'package:provider/provider.dart';

class DetailScreenHelper extends ChangeNotifier {
  Widget pizzaImage(String image) {
    return Center(
      child: SizedBox(
        height: 250,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(image),
        ),
      ),
    );
  }

  Widget middleData(String name, String rating, String price) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              EvaIcons.star,
              color: Colors.amber,
            ),
            Text(
              '  ' + rating,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[850],
              ),
            ),
            Text(
              "\$ " + price,
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget selectDetailBox(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Provider.of<DetailScreenViewModel>(context,
                                  listen: false)
                              .smallTapped();
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.cyan),
                            color: Provider.of<DetailScreenViewModel>(context,
                                            listen: true)
                                        .getSize !=
                                    'S'
                                ? Colors.white
                                : Colors.cyan,
                          ),
                          child: Center(
                              child: Text(
                            'S',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<DetailScreenViewModel>(context,
                                  listen: false)
                              .mediumTapped();
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.cyan),
                            color: Provider.of<DetailScreenViewModel>(context,
                                            listen: true)
                                        .getSize !=
                                    'M'
                                ? Colors.white
                                : Colors.cyan,
                          ),
                          child: Center(
                              child: Text(
                            'M',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<DetailScreenViewModel>(context,
                                  listen: false)
                              .largeTapped();
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.cyan),
                            color: Provider.of<DetailScreenViewModel>(context,
                                            listen: true)
                                        .getSize !=
                                    'L'
                                ? Colors.white
                                : Colors.cyan,
                          ),
                          child: Center(
                              child: Text(
                            'L',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Add more stuff',
                      style: TextStyle(
                        color: Colors.grey[850],
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Cheese',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                EvaIcons.minus,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                Provider.of<DetailScreenViewModel>(context,
                                        listen: false)
                                    .deleteCheese();
                              }),
                          Text(
                            '${Provider.of<DetailScreenViewModel>(context, listen: true).getCheeseValue}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                EvaIcons.plus,
                                color: Colors.greenAccent,
                              ),
                              onPressed: () {
                                Provider.of<DetailScreenViewModel>(context,
                                        listen: false)
                                    .addCheese();
                              })
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Beacon',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                EvaIcons.minus,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                Provider.of<DetailScreenViewModel>(context,
                                        listen: false)
                                    .deleteBeacon();
                              }),
                          Text(
                            '${Provider.of<DetailScreenViewModel>(context, listen: true).getBeaconValue}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                EvaIcons.plus,
                                color: Colors.greenAccent,
                              ),
                              onPressed: () {
                                Provider.of<DetailScreenViewModel>(context,
                                        listen: false)
                                    .addBeacon();
                              })
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Onion',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                EvaIcons.minus,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                Provider.of<DetailScreenViewModel>(context,
                                        listen: false)
                                    .deleteOnion();
                              }),
                          Text(
                            '${Provider.of<DetailScreenViewModel>(context, listen: true).getOnionValue}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                EvaIcons.plus,
                                color: Colors.greenAccent,
                              ),
                              onPressed: () {
                                Provider.of<DetailScreenViewModel>(context,
                                        listen: false)
                                    .addOnion();
                              })
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttons(
      BuildContext context, String name, String image, String price) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
        child: Text('Add to Card'),
        onPressed: () async {
          await Provider.of<DetailScreenViewModel>(context, listen: false)
              .addToCart(context, name, image, price);
        },
      ),
      FloatingActionButton(
        onPressed: () {
          // Navigator.pushReplacement(
          //     context,
          //     PageTransition(
          //       child: CartScreen(),
          //       type: PageTransitionType.fade,
          //     ));
        },
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
    ]);
  }
}

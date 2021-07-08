import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizzato_mvvm/app/routes.dart';
import 'package:pizzato_mvvm/core/viewmodels/CartScreenViewModel.dart';
import 'package:provider/provider.dart';

class CartScreenHelper extends ChangeNotifier {
  Widget headerText(BuildContext context) {
    //Provider.of<Calculations>(context, listen: true).orderPrices = [];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'YOUR',
                style: TextStyle(color: Colors.grey[800], fontSize: 20),
              ),
              Text(
                'CART',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget cartData(BuildContext context, Future myFuture) {
    return SizedBox(
      height: 350,
      child: FutureBuilder(
          future: myFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('animations/delivery.json'),
              );
            } else {
              return ListView.builder(
                  physics: snapshot.data.length < 3
                      ? NeverScrollableScrollPhysics()
                      : ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          snapshot.data[index].data()['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        leading: CircleAvatar(
                          child: Image.network(
                              snapshot.data[index].data()['image']),
                        ),
                        subtitle: Text(
                          'price: ' +
                              Provider.of<CartScreenViewModel>(context,
                                      listen: false)
                                  .getOrderPrices[index]
                                  .toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.read_more,
                              size: 35,
                              color: Colors.grey[850],
                            ),
                            onPressed: () {
                              Routes.sailor.navigate('/cart_detail',
                                  params: {'snapshot': snapshot.data[index]});
                            }),
                      ),
                    );
                  });
            }
          }),
    );
  }

  Widget subTotalBox(BuildContext context) {
    //Provider.of<Calculations>(context, listen: false).calculateTotalPrice();
    return Container(
      width: 370,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular((40)),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'SUBTOTAL',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "\$ " +
                    Provider.of<CartScreenViewModel>(context, listen: true)
                        .getTotalPrice
                        .toString(),
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'DELIVERY CHARGES',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "\$ " + '10',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'TOTAL',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$ " +
                    (Provider.of<CartScreenViewModel>(context, listen: true)
                                .getTotalPrice +
                            10)
                        .toString(),
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget button() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'PLACE THE ORDER',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

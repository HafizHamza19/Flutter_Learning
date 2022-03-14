import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/getxImplementation/contoller/cartController.dart';
import 'package:flutterlearn/getxImplementation/contoller/shoppingcontroller.dart';
import 'package:flutterlearn/main.dart';
import 'package:flutterlearn/newUi.dart';

import 'package:get/get.dart';

class ShoppingUi extends StatelessWidget {
  final _shoppingController = Get.put(ShoppingController());
  final _addtocartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: GetX<ShoppingController>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.blue[200],
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _shoppingController
                                        .products[index].productName,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    _shoppingController
                                        .products[index].productImage,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Price : \$ ${_shoppingController.products[index].price.toString()}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'add to cart',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        FloatingActionButton(
                                          onPressed: () {
                                            _addtocartController.Addtocart(
                                                controller.products[index]);
                                          },
                                          child: Icon(Icons.add),
                                        ),
                                        FloatingActionButton(
                                          onPressed: () {
                                            _addtocartController.Removetocart(
                                                controller.products[index]);
                                          },
                                          child: Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          })),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Amount: \$${controller.totalPrice}",
                style: TextStyle(color: Colors.black, fontSize: 24),
              );
            }),
          ]),
          SizedBox(
            height: 25,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => newUi()));
        },
        icon: Icon(
          Icons.add_shopping_cart,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20),
          );
        }),
      ),
    );
  }
}

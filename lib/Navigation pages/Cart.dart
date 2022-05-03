import 'package:flutter/material.dart';

import '../Buttons.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppBarButton(),
        title: Text('Cart',style: TextStyle(fontSize: 20,color: Colors.green),),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    ),
    body:Center(
      child: Text('Cart Body'),
    ),
    );
  }
}

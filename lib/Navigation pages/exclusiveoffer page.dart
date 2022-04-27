import 'package:flutter/material.dart';
import '../product details/models.dart';
import 'required Widget.dart';

class ExclusiveOffers extends StatefulWidget {
  final List<Products> productList;
  final String appbartitle;

  const ExclusiveOffers(
      {Key? key, required this.productList, required this.appbartitle})
      : super(key: key);

  @override
  State<ExclusiveOffers> createState() => _ExclusiveOffersState();
}

class _ExclusiveOffersState extends State<ExclusiveOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.green,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.appbartitle,
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(child: buildGrid(context, widget.productList)),
      ),
    );
  }
}

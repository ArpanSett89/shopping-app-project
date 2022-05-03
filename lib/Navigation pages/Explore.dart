import 'package:flutter/material.dart';
import 'package:shoppingapp/Navigation%20pages/exclusiveoffer%20page.dart';
import 'package:shoppingapp/Navigation%20pages/required%20Widget.dart';
import 'package:shoppingapp/product%20details/models.dart';

import '../Buttons.dart';
import '../product details/product list.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}
class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(),
        title: Text(
          'Explore',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Column(
                children: [
                  searchBar(),
                  buildGrid(context,itemList,),
                ],
              )),
        ),
      ),
    );
  }
}
Widget buildGrid(BuildContext context, List<ExploreItems> product,) {
  return NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (overScroll) {
      overScroll.disallowIndicator();
      return false;
    },
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 1.0),
      itemCount:product.length,
      itemBuilder: (BuildContext context,  index,) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExclusiveOffers(appbartitle: product[index].title, productList: product[index].ExploreItemList,)),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: product[index].ItemBackground,
                border: Border.all(
                    color: product[index].itemColor,
                    width: 2.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    color: Colors.white,
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      child: Image.asset(
                        product[index].imageURL,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    product[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
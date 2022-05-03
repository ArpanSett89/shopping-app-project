import 'package:flutter/material.dart';
import 'package:shoppingapp/product%20details/product%20list.dart';
import 'Groceries.dart';
import 'exclusiveoffer page.dart';
import 'required Widget.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:  NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
        child: Column(
            children: [
              profile(),
              searchBar(),
              CustomList( items: images,),
              offers(context, 'Exclusive offer', 'See all', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExclusiveOffers(
                            appbartitle: 'Exclusive Offers',
                            productList: ExclusiveOfferList,
                          )),
                );
              }),
              List1(product: ExclusiveOfferList),
              offers(context,'Best Selling', 'See all', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExclusiveOffers(
                            appbartitle: 'Best Selling',
                            productList: BestSellingList,
                          )),
                );
              }),
              List1(product: BestSellingList),
              offers(context, 'Groceries', 'See all', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroceriesView(
                            appBarTitle: 'Groceries',
                            productList: Item,
                          )),
                );
              }),
              listGrocery(context, Item),
            ],
        ),
      ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoppingapp/Navigation%20pages/variables.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Buttons.dart';
import '../product details/models.dart';
import '../product details/product list.dart';
import 'exclusiveoffer page.dart';
import 'onItemTap.dart';

Widget buildGrid(BuildContext context, List<Products> product) {
  return NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (overScroll) {
      overScroll.disallowIndicator();
      return false;
    },
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7),
      itemCount: product.length,
      itemBuilder: (
        BuildContext context,
        index,
      ) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetails(
                      appBarTitle: product[index].title, item: product[index])),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 1.0,
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
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    child: Image.asset(
                      product[index].imageURL,
                      fit: BoxFit.cover,
                      height: 150,
                      width: 190,
                    ),
                  ),
                ),
                Text(
                  product[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    product[index].subtitle,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.euro_symbol_outlined,
                                size: 15, color: Colors.grey),
                            Text(
                              product[index].amount,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                              size: 20,
                            )),
                        CustomFloatingButton(
                          w: 32,
                          h: 32,
                          r: 11,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget list(BuildContext context, List<String> items) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 185,
    child: Stack(children: [
      NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    items[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: _buildIndicator(),
      )
    ]),
  );
}

Widget _buildIndicator() => SmoothPageIndicator(
      controller: controller,
      count: images.length,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
          spacing: 10.0,
          radius: 15.0,
          dotWidth: 10.0,
          dotHeight: 10.0,
          paintStyle: PaintingStyle.fill,
          dotColor: Colors.grey,
          activeDotColor: Colors.green),
    );

Widget profile() {
  return Container(
    margin: EdgeInsets.all(16),
    child: Column(
      children: [
        CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black.withOpacity(0.2),
            child: Icon(
              Icons.person,
              size: 20,
              color: Colors.green,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Ecospace, NewTown',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        )
      ],
    ),
  );
}

Widget searchBar() {
  return Container(
    margin: const EdgeInsets.all(16),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            )),
        hintText: 'Search Store',
      ),
    ),
  );
}

Widget offers(context, title, button, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            button,
            style: TextStyle(
              fontSize: 12,
              color: Colors.green,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget list1(BuildContext context, List<Products> product) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 200,
    child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetails(
                          appBarTitle: product[index].title,
                          item: product[index])),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 1.0,
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
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        child: Image.asset(
                          product[index].imageURL,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 140,
                        ),
                      ),
                    ),
                    Text(
                      product[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        product[index].subtitle,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 140,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.attach_money_rounded,
                                    size: 15, color: Colors.grey),
                                Text(
                                  product[index].amount,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            CustomFloatingButton(
                              w: 32,
                              h: 32,
                              r: 11,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    ),
  );
}

Widget listGrocery(BuildContext context, List<GroceryItems> items) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExclusiveOffers(
                            appbartitle: 'Pulses',
                            productList: Pulses,
                          )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15),
                  color: items[index].itemColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            items[index].imageURL,
                            fit: BoxFit.cover,
                            height: 50,
                            width: 80,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          items[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
  );
}

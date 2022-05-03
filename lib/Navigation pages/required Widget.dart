import 'package:flutter/material.dart';
import 'package:shoppingapp/Navigation%20pages/variables.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Buttons.dart';
import '../product details/models.dart';
import '../product details/product list.dart';
import 'exclusiveoffer page.dart';
import 'onItemTap.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                    padding: const EdgeInsets.only(left: 10, ),
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
                        SizedBox(width: 9,),
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

class CustomList extends StatefulWidget {
  final List<String> items;
  const CustomList({Key? key,required this.items}) : super(key: key);

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 185,
      child: Stack(children: [
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: Swiper(
              onIndexChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.items[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          alignment: Alignment.bottomCenter,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: map(
                widget.items,
                    (index, image) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.centerLeft,
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.green
                            : Colors.grey),
                  );
                },
              ))
        )
      ]),
    );
  }
}






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
                            productList: items[index].GroceryItemsList,
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

class List1 extends StatefulWidget {
  final List<Products> product;

  const List1({Key? key, required this.product}) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  bool isFavourite =false;
  @override
  Widget build(BuildContext context) {
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
                            appBarTitle: widget.product[index].title,
                            item: widget.product[index])),
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
                            widget.product[index].imageURL,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 140,
                          ),
                        ),
                      ),
                      Text(
                        widget.product[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          widget.product[index].subtitle,
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
                                    widget.product[index].amount,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isFavourite=!isFavourite;
                                    });
                                  },
                                  icon: Icon(
                                    isFavourite
                                        ? Icons.favorite_outline
                                        : Icons.favorite,
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
}



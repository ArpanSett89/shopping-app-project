import 'package:flutter/material.dart';
import '../Buttons.dart';
import '../product details/models.dart';
import '../product details/product list.dart';
import 'exclusiveoffer page.dart';
class GroceriesView extends StatefulWidget {
  final List <GroceryItems> productList;
  final String appBarTitle;
  const GroceriesView({Key? key, required this.productList, required this.appBarTitle}) : super(key: key);

  @override
  State<GroceriesView> createState() => _GroceriesViewState();
}

class _GroceriesViewState extends State<GroceriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(),
        title: Text(
          widget.appBarTitle,
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: buildGrid(context,widget.productList,)),
      ),
    );
  }
}
Widget buildGrid(BuildContext context, List<GroceryItems> product,) {
  return GridView.builder(
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 1.0),
    itemCount:product.length,
    itemBuilder: (BuildContext context,  index,) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExclusiveOffers(appbartitle: 'Pulses', productList: product[index].GroceryItemsList,)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: product[index].itemColor,
              border: Border.all(
                  color: Colors.black.withOpacity(0.2),
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
                      fontSize: 20,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
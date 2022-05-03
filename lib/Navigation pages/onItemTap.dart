import 'package:flutter/material.dart';
import 'package:shoppingapp/product%20details/models.dart';

import '../Buttons.dart';
class ItemDetails extends StatefulWidget {
  final String appBarTitle;
  final Products item;
  const ItemDetails({Key? key, required this.appBarTitle, required this.item}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
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
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    child: Image.asset(widget.item.imageURL,
                      fit: BoxFit.cover,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(widget.item.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.item.subtitle,
                  style: TextStyle(
                      fontSize: 20, color: Colors.black.withOpacity(0.5)),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.euro_symbol_outlined,
                            size: 20, color: Colors.grey),
                        Text(
                          widget.item.amount,
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                          size: 20,
                        )),
                    CustomFloatingButton(w: 52,h: 52,r: 15,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

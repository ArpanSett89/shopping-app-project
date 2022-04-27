import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shoppingapp/Navigation%20pages/Account.dart';
import 'package:shoppingapp/Navigation%20pages/Cart.dart';
import 'package:shoppingapp/Navigation%20pages/Explore.dart';
import 'package:shoppingapp/Navigation%20pages/Favourite.dart';
import 'package:shoppingapp/Navigation%20pages/Shop.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
final List<Widget> TapFunction = <Widget>[
  Shop(),
  Explore(),
  Cart(),
  Favourite(),
  Account(),
];

class _HomeState extends State<Home> {
  int  _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TapFunction.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,),
              label: 'Shop',),
              BottomNavigationBarItem(icon: Icon(Icons.search_outlined,),
                label: 'Explore',),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),
                label: 'Cart',),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline,),
                label: 'Favourite',),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline,),
                  label: 'Account'),
            ],
            unselectedItemColor: Colors.black,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            onTap: _onItemTapped,
            showUnselectedLabels: true,
          ),
        ),
    );
  }
}
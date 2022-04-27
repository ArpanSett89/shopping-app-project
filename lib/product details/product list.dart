import 'package:flutter/material.dart';
import 'package:shoppingapp/product%20details/models.dart';

List<Products> ExclusiveOfferList = [
  Products(
      title: 'Apple',
      subtitle: 'Fruit',
      amount: '1.3',
      quantity: 1,
      imageURL: 'images/a.jpg'),
  Products(
      title: 'Banana',
      subtitle: 'Fruits',
      amount: '1.0',
      quantity: 1,
      imageURL: 'images/b.jpg'),
  Products(
      title: 'Grapes',
      subtitle: 'Fruits',
      amount: '2.0',
      quantity: 1,
      imageURL: 'images/g.jpg'),
  Products(
      title: 'JackFruits',
      subtitle: 'Fruits',
      amount: '0.5',
      quantity: 1,
      imageURL: 'images/j.jpg'),
  Products(
      title: 'Blue Berry',
      subtitle: 'Fruits',
      amount: '2.5',
      quantity: 1,
      imageURL: 'images/bb.jpeg'),
  Products(
      title: 'StrawBerry',
      subtitle: 'Fruits',
      amount: '1.6',
      quantity: 1,
      imageURL: 'images/s.jpg'),
];
List<Products> BestSellingList = [
  Products(
      title: 'Pepsi',
      subtitle: 'Fruit',
      amount: '25',
      quantity: 1,
      imageURL: 'images/p.jpg'),
  Products(
      title: 'Coco-Cola',
      subtitle: 'Fruits',
      amount: '25',
      quantity: 1,
      imageURL: 'images/c.jpg'),
  Products(
      title: 'Amul Butter',
      subtitle: 'Fruits',
      amount: '30',
      quantity: 1,
      imageURL: 'images/ab.png'),
  Products(
      title: 'Horlicks',
      subtitle: 'Fruits',
      amount: '50',
      quantity: 1,
      imageURL: 'images/h.jpeg'),
  Products(
      title: 'Blue Berry',
      subtitle: 'Fruits',
      amount: '2.5',
      quantity: 1,
      imageURL: 'images/bb.jpeg'),
  Products(
      title: 'Oliv Oli',
      subtitle: 'Fruits',
      amount: '100',
      quantity: 1,
      imageURL: 'images/o.jpeg'),
];
List<Products> Pulses = [
  Products(
      title: 'Dry Beans ',
      subtitle: 'Common Pulses',
      amount: '10',
      quantity: 1,
      imageURL: 'images/db.jpeg'),
  Products(
      title: 'Lentils ',
      subtitle: 'Common Pulses',
      amount: '15',
      quantity: 1,
      imageURL: 'images/l.jpg'),
  Products(
      title: 'Dry Peas ',
      subtitle: 'Common Pulses',
      amount: '10',
      quantity: 1,
      imageURL: 'images/dp.jpg'),
  Products(
      title: 'Chickpeas  ',
      subtitle: 'Common Pulses',
      amount: '5',
      quantity: 1,
      imageURL: 'images/c2.jpg'),
  Products(
      title: 'Cowpeas',
      subtitle: 'Common Pulses',
      amount: '10',
      quantity: 1,
      imageURL: 'images/c3.jpg'),
  Products(
      title: 'Vetches  ',
      subtitle: 'Common Pulses',
      amount: '10',
      quantity: 1,
      imageURL: 'images/v.jpeg'),
];

List<Products> Rice = [];

List<GroceryItems> Item = [
  GroceryItems(
      title: 'Pulses',
      itemColor: Colors.pink.shade300,
      imageURL: 'images/pauls.jpg'),
  GroceryItems(
      title: 'Rices',
      itemColor: Colors.lightBlueAccent,
      imageURL: 'images/rice.jpeg'),
  GroceryItems(
      title: 'Fruits',
      itemColor: Colors.yellow.shade400,
      imageURL: 'images/fruit.jpg'),
  GroceryItems(
      title: 'Oils',
      itemColor: Colors.green.shade300,
      imageURL: 'images/oil.jpg'),
  GroceryItems(
      title: 'Jams & Honey',
      itemColor: Colors.red.shade200,
      imageURL: 'images/jams.jpg'),
  GroceryItems(
      title: 'Chocolate',
      itemColor: Colors.indigoAccent.shade200,
      imageURL: 'images/chocolate.jpeg'),
  GroceryItems(
      title: 'Biscuits',
      itemColor: Colors.tealAccent.shade200,
      imageURL: 'images/biskuts.png'),
  GroceryItems(
      title: 'Snacks',
      itemColor: Colors.deepOrangeAccent.shade200,
      imageURL: 'images/snacks.jpg'),
  GroceryItems(
      title: 'Eggs',
      itemColor: Colors.purple.shade300,
      imageURL: 'images/eggs.jpg'),
  GroceryItems(
      title: 'Mashrooms',
      itemColor: Colors.lightGreenAccent,
      imageURL: 'images/mashrooms.jpg'),
];
final List<IconData> icondata = [
  Icons.shopping_bag_outlined,
  Icons.library_books_outlined,
  Icons.location_on_outlined,
  Icons.payment,
  Icons.local_play_outlined ,
  Icons.notification_important_outlined,
  Icons.help_outline_outlined,
  Icons.info_outline
];
final List<String> title = <String>[
  'Orders',
  'My Details',
  'Delivery Address',
  'Payment Methods',
  'Promo Code',
  'Notification',
  'Help',
  'About'
];
final List<String> images = <String>[
  'images/picforbanner.jpg',
  'images/picforbanner1.jpg',
  'images/picforbanner2.jpg',
];

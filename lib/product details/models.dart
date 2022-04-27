import 'dart:ui';

class Products {
  String title;
  String subtitle;
  String amount;
  int quantity;
  String imageURL;

  Products(
      {required this.title,
      required this.subtitle,
      required this.amount,
      required this.quantity,
      required this.imageURL});
}

class GroceryItems {
  String title;
  Color itemColor;
  String imageURL;

  GroceryItems(
      {required this.title, required this.itemColor, required this.imageURL});
}

class ExploreItems {
  String title;
  Color itemColor;
  Color ItemBackground;
  String imageURL;

  ExploreItems({
    required this.title,
    required this.itemColor,
    required this.imageURL,
    required this.ItemBackground,
  });
}

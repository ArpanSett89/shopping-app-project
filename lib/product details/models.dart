import 'dart:ui';
class Products {
  int id;
  String title;
  String subtitle;
  String amount;
  int quantity;
  String imageURL;

  Products(
      {required this.id,
        required this.title,
      required this.subtitle,
      required this.amount,
      required this.quantity,
      required this.imageURL});
}

class GroceryItems {
  String title;
  Color itemColor;
  String imageURL;
  List <Products> GroceryItemsList;

  GroceryItems(
      {required this.title, required this.itemColor, required this.imageURL,required this.GroceryItemsList});
}

class ExploreItems {
  String title;
  Color itemColor;
  Color ItemBackground;
  String imageURL;
  List <Products> ExploreItemList;

  ExploreItems({
    required this.title,
    required this.itemColor,
    required this.imageURL,
    required this.ItemBackground,
    required this.ExploreItemList
  });
}

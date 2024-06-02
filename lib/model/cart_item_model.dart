import 'package:coffee/model/product.dart';

class CartItemModel{
  int quantity;
  Product product;

  CartItemModel({this.quantity = 1,required this.product});
}
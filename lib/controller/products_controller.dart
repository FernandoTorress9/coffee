import 'package:coffee/model/cart_item_model.dart';
import 'package:coffee/service/data_source.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class ProductsController extends GetxController {
  ProductsDataSource productsDataSource;

  ProductsController(this.productsDataSource);

  Rx<bool> isVisible = false.obs;
  List<Product> products = [];
  List<CartItemModel> cartItems = [];
  Rx<bool> isLoading = false.obs;

  Future fetchData() async {
    isLoading.value = true;
    products = await productsDataSource.getProducts();
    print(products);
    isLoading.value = false;
    await Future.delayed(const Duration(milliseconds: 100));
    isVisible.value = true;
  }

  void toggleFav(Product product) {
    product.isFav = !product.isFav;
    update(['fav']);
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((element) => element.product.id == product.id);
    product.isAddedToCart = false;
    print('cart_Items_length : ${cartItems.length} ');
    update(['cart', 'cart ${product.id}']);
  }

  void addToCart(Product product, {quantity = 1}) {
    cartItems.add(CartItemModel(product: product, quantity: quantity));
    product.isAddedToCart = true;
    print('cart_Items_length : ${cartItems.length} ');
    update(['cart', 'cart ${product.id}']);
  }

  void updateQuantity(int index, int added) {
    if (added == -1 && cartItems[index].quantity == 1) {
      removeFromCart(cartItems[index].product);
      return;
    }
    cartItems[index].quantity = cartItems[index].quantity + added;
    update(['quantity ${cartItems[index].product.id}']);
  }
}

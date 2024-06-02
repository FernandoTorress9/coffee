import 'package:coffee/controller/products_controller.dart';
import 'package:coffee/view/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final ProductsController _productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(47, 47, 47, 1.0),
        ),
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1.0),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<ProductsController>(
                id: 'cart',
                builder: (controller) {
                  return ListView.builder(
                    itemCount: _productsController.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _productsController.cartItems[index];
                      print('item $index = ${item.quantity}');
                      return CartItem(
                        cartItem: item,
                        onDec: () {
                          _productsController.updateQuantity(index, -1);
                        },
                        onInc: () {
                          _productsController.updateQuantity(index, 1);
                        },
                        onRemove: () {
                          _productsController.removeFromCart(item.product);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('BUY'),
              ),
            )
          ],
        ));
  }
}

import 'package:coffee/controller/products_controller.dart';
import 'package:coffee/controller/quantity_controller.dart';
import 'package:coffee/model/product.dart';
import 'package:coffee/view/show_details/widgets/quantitiy_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDetailsScreen extends StatelessWidget {
  ShowDetailsScreen({super.key});

  final QuantityController quantityController = QuantityController();

  @override
  Widget build(BuildContext context) {
    final Product? product = Get.arguments as Product?;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1.0),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    )),
                Center(
                  child: SizedBox(
                    height: 200,
                    child: Image.asset(product!.image),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'BEST COFFEE',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityIndicator(
                        onDec: () {
                          quantityController.dec();
                        },
                        onInc: () {
                          quantityController.inc();
                        },
                        quantityController: quantityController),
                    Obx(() => Text(
                        '\$ ${quantityController.quantity.value * product.price}',
                        style: const TextStyle(color: Colors.white)))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(product.description,
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(
                  height: 40,
                ),
                const Text('Volume : 60 ml',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: GetBuilder<ProductsController>(
                        id: 'cart ${product.id}',
                        builder: (controller) {
                          return ElevatedButton(
                            onPressed: () {
                              if (product.isAddedToCart) {
                                controller.removeFromCart(product);
                              } else {
                                if (quantityController.quantity.value > 0) {
                                  controller.addToCart(product,
                                      quantity:
                                          quantityController.quantity.value);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor:
                                    const Color.fromRGBO(68, 68, 68, 1.0)),
                            child: Text(product.isAddedToCart
                                ? "Remove From Cart"
                                : 'Add to Cart'),
                          );
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    GetBuilder<ProductsController>(
                      id: 'fav',
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            controller.toggleFav(product);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange),
                            child: product.isFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

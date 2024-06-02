import 'package:coffee/controller/products_controller.dart';
import 'package:coffee/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.item,
      required this.onClick,
      required this.onAddClick});

  final Product item;

  final VoidCallback onClick;
  final VoidCallback onAddClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(47, 47, 47, 1.0),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3),
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset('assets/${item.image}')),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              item.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(item.subtitle,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            const Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${item.price}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: onAddClick,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(30)),
                    child: GetBuilder<ProductsController>(
                      id: 'cart ${item.id}',
                      builder: (controller) {
                        return item.isAddedToCart
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.add,
                                color: Colors.white,
                              );
                      },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:coffee/controller/products_controller.dart';
import 'package:coffee/model/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.cartItem,
      required this.onDec,
      required this.onInc,
      required this.onRemove});

  final CartItemModel cartItem;
  final VoidCallback onDec;
  final VoidCallback onInc;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      height: 150,
      width: double.infinity,
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
      child: Row(
        children: [
          SizedBox(
            height: 140,
            width: 80,
            child: Image.asset('assets/${cartItem.product.image}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.product.title,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(cartItem.product.subtitle,
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
                const Spacer(),
                Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: onDec,
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                      GetBuilder<ProductsController>(
                        id: 'quantity ${cartItem.product.id}',
                        builder: (controller) {
                          return Text(
                            cartItem.quantity.toString(),
                            style: const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      IconButton(
                          onPressed: onInc,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

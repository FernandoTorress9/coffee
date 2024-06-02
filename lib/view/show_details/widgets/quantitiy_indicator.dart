import 'package:coffee/controller/quantity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityIndicator extends StatelessWidget {
  const QuantityIndicator(
      {super.key,
      required this.onDec,
      required this.onInc,
      required this.quantityController});

  final VoidCallback onDec;
  final VoidCallback onInc;
  final QuantityController quantityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
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
          Obx(() => Text(
                quantityController.quantity.value.toString(),
                style: const TextStyle(color: Colors.white),
              )),
          IconButton(
              onPressed: onInc,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

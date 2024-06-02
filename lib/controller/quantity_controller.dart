import 'package:get/get.dart';

class QuantityController {
  Rx<int> quantity = 0.obs;

  void inc() {
    quantity.value = quantity.value + 1;
  }

  void dec() {
    if(quantity.value == 0){
      return;
    }
    quantity.value = quantity.value - 1;
  }
}

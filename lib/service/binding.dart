import 'package:coffee/controller/products_controller.dart';
import 'package:coffee/service/data_source.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController(ProductsDataSource()));
  }
}

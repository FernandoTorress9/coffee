import 'package:coffee/model/product.dart';

class ProductsDataSource {
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<Product> products = [];
    final List<dynamic> jsonList = productsJson()['data'];
    int i = 0;
    for (var element in jsonList) {
      print('element: $element');
      products.add(Product.fromJson(i++, element as Map<String, dynamic>));
    }
    return products;
  }

  Map productsJson() {
    var fakeData = {
      "data": [
        {
          "title": "Latte",
          "image": "latte.png",
          "subTitle": "Best coffee",
          "description":
              "Hot coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "quantity": 0,
          "isFav": false,
          "price": 30,
        },
        {
          "title": "Espresso",
          "image": "espresso.png",
          "description":
              "Hot coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "subTitle": "Best coffee",
          "quantity": 0,
          "isFav": false,
          "price": 30,
        },
        {
          "title": "Black Coffee",
          "image": "black_coffee.png",
          "description":
              "Hot coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "subTitle": "Best coffee",
          "quantity": 0,
          "isFav": false,
          "price": 30,
        },
        {
          "title": "Cold Coffee",
          "description":
              "Cold coffee is a steaming beverage brewed from roasted coffee beans. The dark, aromatic liquid offers a stimulating caffeine kick and a rich, slightly bitter taste.pen_spark",
          "image": "cold_coffee.png",
          "subTitle": "Best coffee",
          "quantity": 0,
          "isFav": false,
          "price": 30,
        },
      ]
    };
    return fakeData;
  }
}

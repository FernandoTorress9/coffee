class Product {
  int id;
  String title;
  String image;
  String subtitle;
  String description;
  bool isFav;
  double price;
  bool isAddedToCart = false;

  Product(
      {
        required this.id,
        required this.title,
      required this.image,
      required this.subtitle,
      required this.description,
      required this.isFav,
      required this.price});

  factory Product.fromJson(int id,Map<String, dynamic> data) {
    return Product(
        id: id,
        title: data['title'],
        image: data['image'],
        subtitle: data['subTitle'],
        description: data['description'],
        isFav: data['isFav'],
        price: (data['price'] as int).toDouble());
  }
}


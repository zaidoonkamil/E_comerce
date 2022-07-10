
class ProductModel {
  late String name, image, description, price, productId;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
     required this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
     'productId': productId,
    };
  }
}
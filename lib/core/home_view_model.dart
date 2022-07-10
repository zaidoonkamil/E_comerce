import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/cart_model.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';
import 'firestore_home.dart';


class HomeViewModel extends GetxController {
  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  List<CartModel> _cart = [];

  List<CategoryModel> get categories => _categories;

  List<ProductModel> get products => _products;

  List<CartModel> get cart => _cart;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    _getCategoriesFromFireStore();
    _getProductsFromFireStore();
    _getcartsFromFireStore();
  }

  _getCategoriesFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> categoriesSnapshot =
    await FirestoreHome().getCategoriesFromFirestore();
    categoriesSnapshot.forEach((category) {
      _categories
          .add(CategoryModel.fromJson(category.data() as Map<String, dynamic>));
    });
    _loading = false;
    update();
  }

  _getProductsFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> productsSnapshot =
    await FirestoreHome().getProductsFromFirestore();
    productsSnapshot.forEach((product) {
      _products
          .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      print(_products.length);
    });
    _loading = false;
    update();
  }

  _getcartsFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> productsSnapshot =
    await FirestoreHome().getCartFromFirestore();
    productsSnapshot.forEach((cart) {
      _cart
          .add(CartModel.fromJson(cart.data() as Map<String, dynamic>));
    });
    _loading = false;
    update();
  }

}


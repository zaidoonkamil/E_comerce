import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHome {
  final CollectionReference _categoriesCollection =
  FirebaseFirestore.instance.collection('categories');

  final CollectionReference _productsCollection =
  FirebaseFirestore.instance.collection('products');

  final CollectionReference _cartCollection =
  FirebaseFirestore.instance.collection('cart');

  Future<List<QueryDocumentSnapshot>> getCategoriesFromFirestore() async {
    var categories = await _categoriesCollection.get();
    return categories.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProductsFromFirestore() async {
    var products = await _productsCollection.get();
    return products.docs;
  }
  Future<List<QueryDocumentSnapshot>> getCartFromFirestore() async {
    var carts = await _cartCollection.get();
    return carts.docs;
  }
}

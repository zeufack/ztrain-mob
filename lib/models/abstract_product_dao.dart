import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/Product.dart';

abstract class AbsProductDAO {
  Future<List<Product>> getAllProduct();
  Future<Product> getProductById();
  Future<Product> setProductFavorite();
}

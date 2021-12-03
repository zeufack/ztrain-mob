import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/abstract_product_dao.dart';

class ProductDAO extends AbsProductDAO {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Products');

  @override
  Stream<QuerySnapshot> getAllProduct() {
    try {
      collection.snapshots();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Product> getProductById() {
    throw UnimplementedError();
  }

  @override
  Future<Product> setProductFavorite() {
    throw UnimplementedError();
  }
}

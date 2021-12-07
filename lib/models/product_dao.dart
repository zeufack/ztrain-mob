import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/abstract_product_dao.dart';

class ProductDAO extends AbsProductDAO {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Products');

  @override
  Future<List<Product>> getAllProduct() async {
    List<Product> productList = [];
    try {
      await collection.get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Product product = Product(
                id: doc.id,
                images: doc['images'],
                title: doc['title'],
                price: doc['price'],
                description: doc['description'],
                isFavourite: doc['isFavorite'],
                isPopular: true,
              );
              productList.add(product);
            })
          });
      print(productList);
      return productList;
    } catch (e) {
      print(e);
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

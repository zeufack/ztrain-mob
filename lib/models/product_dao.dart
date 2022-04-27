import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/abstract_product_dao.dart';

class ProductDAO extends AbsProductDAO {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('productList');
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('Carts');
  final CollectionReference favoritesCollection =
      FirebaseFirestore.instance.collection('Favorites');
  final FirebaseAuth auth = FirebaseAuth.instance;
  double amount = 0.0;

  @override
  Future<List<Product>> getAllProduct() async {
    List<Product> productList = [];
    try {
      await productCollection.get().then((QuerySnapshot querySnapshot) => {
            if (querySnapshot != null)
              {
                querySnapshot.docs?.forEach((doc) {
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
              }
          });
      // print(productList);
    } catch (e) {
      print(e);
    }
    return productList;
  }

  @override
  Future<List<Cart>> getProductForCart() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    List<Cart> carts = [];
    try {
      await cartCollection
          .where('userId', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  Cart cart = Cart(
                      id: doc.id,
                      userId: doc['userId'],
                      productId: doc['productId'],
                      quantity: doc['quantity'],
                      price: doc['price']);
                  carts.add(cart);
                })
              });
    } catch (e) {}
    return carts;
  }

  @override
  Future<Product> getProductById(String documentId) async {
    Product testProduct;
    try {
      await productCollection.doc(documentId).get().then((value) => {
            testProduct = Product(
                id: value.id,
                images: value['images'],
                title: value['title'],
                price: value['price'],
                description: value['description'])
          });
    } catch (e) {
      print(e);
    }
    return testProduct;
  }

  @override
  Future<Product> setProductFavorite() {
    throw UnimplementedError();
  }

  @override
  Future<void> addToCartd(String productId, int quantity, double price) async {
    final User user = auth.currentUser;
    final uid = user.uid;
    bool exist = false;
    String cardId;
    int existQty;

    await cartCollection
        .where('userId', isEqualTo: uid)
        .where('productId', isEqualTo: productId)
        .get()
        .then((value) => {
              if (value.docs.length == 1)
                {
                  exist = true,
                  cardId = value.docs[0].id,
                  existQty = value.docs[0]['quantity']
                }
            });
    if (exist) {
      return cartCollection
          .doc(cardId)
          .update({'quantity': quantity + existQty})
          .then((value) => print("panier mis à jour"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      return cartCollection
          .add({
            'userId': uid,
            'productId': productId,
            'quantity': quantity,
            'price': price
          })
          .then((value) => {print('Cart Added')})
          .catchError((error) => {print('Failed to add cartd')});
    }
  }

  @override
  Future<void> deletedFromCard(String cartId) async {
    return await cartCollection
        .doc(cartId)
        .delete()
        .then((value) => {print('successfully remove from cart')})
        .catchError((error) => {print(error)});
  }

  @override
  Future<void> setIsFavorite(String productId) async {
    final User user = auth.currentUser;
    final uid = user.uid;
    bool exit = false;
    String docId;

    await favoritesCollection
        .where('productId', isEqualTo: productId)
        .get()
        .then((value) => {
              if (value.docs.length == 1)
                {exit = true, docId = value.docs[0].id}
            });

    if (exit) {
      return await favoritesCollection
          .doc(docId)
          .delete()
          .then((value) => {print('successfully remove from favorite')})
          .catchError((error) => {print(error)});
    } else {
      return await favoritesCollection
          .add({'userId': uid, 'productId': productId})
          .then((value) => {print("successfully add to favotires")})
          .catchError((error) => {print(error)});
    }
  }

  getCountProductCart() {
    final User user = auth.currentUser;
    final uid = user.uid;
    return cartCollection.where('userId', isEqualTo: uid).snapshots();
  }

  getCartAmount() {
    final User user = auth.currentUser;
    final uid = user.uid;
    return cartCollection.where('userId', isEqualTo: uid).snapshots();
  }

  void setAmouunt(double value) async {
    amount = value;
  }

  @override
  getCartStream() {
    final User user = auth.currentUser;
    final uid = user.uid;

    return cartCollection.where('userId', isEqualTo: uid).snapshots();
  }

  @override
  getFavProdStream() {
    final User user = auth.currentUser;
    final uid = user.uid;

    dynamic data =
        favoritesCollection.where('userId', isEqualTo: uid).snapshots();
    return data;
  }
}

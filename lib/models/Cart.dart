import 'package:flutter/material.dart';

class Cart {
  String id;
  final String productId;
  final String userId;
  final int quantity;

  Cart(
      {this.id,
      @required this.userId,
      @required this.productId,
      @required this.quantity});

  Cart.fromJson(Map<String, Object> json)
      : this(
            userId: json['userId'] as String,
            productId: json['productId'] as String,
            quantity: json['quantity'] as int);
  Map<String, Object> toJson() {
    return {'userId': userId, 'productId': productId, 'quantity': quantity};
  }
}

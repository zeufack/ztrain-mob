import 'package:flutter/material.dart';

class FavoriteProduct extends StatefulWidget {
  static String routeName = "/favorite";

  const FavoriteProduct({Key key}) : super(key: key);

  @override
  _FavoriteProductState createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}

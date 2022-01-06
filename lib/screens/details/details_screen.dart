import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(
        product: agrs.product,
        quantity: agrs.quantity,
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  final int quantity;

  ProductDetailsArguments({@required this.product, this.quantity});
}

import 'package:flutter/material.dart';
import 'package:shop_app/models/app_page.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPage.cartScreen,
        key: ValueKey(AppPage.cartScreen),
        child: CartScreen());
  }

  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Votre panier",
            style: TextStyle(color: Colors.black),
          ),
          // Text(
          //   "${demoCarts.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
    );
  }
}

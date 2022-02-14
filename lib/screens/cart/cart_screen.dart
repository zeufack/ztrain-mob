import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/Trash.svg",
        ),
        backgroundColor: Colors.white,
        label: Text(
          'Vider le panier',
          style: TextStyle(color: Color(0xFFFF7643)),
        ),
      ),
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

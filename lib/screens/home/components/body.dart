import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                HomeHeader(),
                SizedBox(height: getProportionateScreenWidth(10)),
                DiscountBanner(),
                Categories(),
                SpecialOffers(),
                SizedBox(height: getProportionateScreenWidth(30)),
                PopularProducts(),
                SizedBox(height: getProportionateScreenWidth(30)),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product_dao.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart> carts = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    dynamic results = await ProductDAO().getProductForCart();
    setState(() {
      carts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductDAO productDAO = Provider.of<ProductDAO>(context, listen: true);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              productDAO.deletedFromCard(carts[index].id);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('retirer du panier')));
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: carts[index]),
          ),
        ),
      ),
    );
  }
}

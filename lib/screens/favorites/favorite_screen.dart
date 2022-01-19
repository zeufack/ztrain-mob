import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/app_page.dart';
import 'package:shop_app/screens/favorites/component/body.dart';

class FavoriteProduct extends StatefulWidget {
  static String routeName = "/favorite";
  static MaterialPage page() {
    return MaterialPage(
        name: AppPage.favoariteProductScreen,
        key: ValueKey(AppPage.favoariteProductScreen),
        child: FavoriteProduct());
  }

  const FavoriteProduct({Key key}) : super(key: key);

  @override
  _FavoriteProductState createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Favoris",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}

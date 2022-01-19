import 'package:flutter/widgets.dart';
import 'package:shop_app/models/app_page.dart';
import 'package:shop_app/models/app_product_manager.dart';
import 'package:shop_app/models/app_state_manager.dart';
import 'package:shop_app/models/app_tab.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/favorites/favorite_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final AppProductManager appProductManager;

  AppRouter({
    this.appStateManager,
    this.appProductManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(() {
      notifyListeners();
    });
    appProductManager.addListener(() {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    appStateManager.removeListener(() {
      notifyListeners();
    });
    appProductManager.removeListener(() {
      notifyListeners();
    });
    super.dispose();
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == AppPage.cartScreen) {
      appStateManager.setCart(false);
      // return true;
    }

    if (route.settings.name == AppPage.detailsScreen) {
      appStateManager.setDisplayProduct(false);
      // return true;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (!appStateManager.isSplashed) SplashScreen.page(),
        if (appStateManager.isSplashed && !appStateManager.isLogin)
          SignInScreen.page(),
        if (appStateManager.isLogin) LoginSuccessScreen.page(),
        if (appStateManager.logInSucess &&
            appStateManager.selectTab == AppTab.home)
          HomeScreen.page(),
        if (appStateManager.logInSucess &&
            appStateManager.selectTab == AppTab.favorite)
          FavoriteProduct.page(),
        if (appStateManager.logInSucess &&
            appStateManager.selectTab == AppTab.profile)
          ProfileScreen.page(),
        if (appStateManager.displayProduct)
          DetailsScreen.page(appProductManager.selectedProduct,
              appProductManager.selectedProductQuantity),
        if (appStateManager.displayCart) CartScreen.page()
      ],
      onPopPage: _handlePopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}

import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/favorite_model.dart';
import 'package:shop_app/models/product_dao.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/sign_in/auth.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey =
  //     "pk_test_51K6WKhIgwaOpAFgPWJ1rpwYWc3Cz8Jpuqalw0ICzHvHmewANDPeZamvQkl1xMYemqlYBJyGweeA7k1ILx5c349Pb00yKzNS48L";
  // Stripe.merchantIdentifier = 'any string works';
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  // Stripe.publishableKey =
  //     'pk_test_51K6WKhIgwaOpAFgPWJ1rpwYWc3Cz8Jpuqalw0ICzHvHmewANDPeZamvQkl1xMYemqlYBJyGweeA7k1ILx5c349Pb00yKzNS48L';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Auth>(
            create: (_) => Auth(),
            lazy: false,
          ),
          Provider(
            create: (_) => ProductDAO(),
            lazy: true,
          ),
          ChangeNotifierProvider(create: (context) => FavoriteModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ZTrain',
          theme: theme(),
          // home: SplashScreen(),
          // We use routeName so that we dont need to remember the name
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ));
  }
}

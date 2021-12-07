import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_dao.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/sign_in/auth.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          // Provider(
          //   create: (_) => ProductDAO(),
          //   lazy: true,
          // )
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

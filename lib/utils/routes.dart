import 'package:flutter/cupertino.dart';
import 'package:invoice_app2/home/home_screen.dart';
import 'package:invoice_app2/product/product_screen.dart';

import '../splash/splash_screen.dart';

Map<String,WidgetBuilder>app_routes={
  // "/":(context) => SplashScreen(),
  // "home":(context) => HomeScreen(),
  "/":(context) => ProductScreen(),

};
import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/product_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/arguments/shop_screen_arguments.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CircleStyle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (ctx) => StartScreen(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
        HomePage.routeName: (ctx) => HomePage(),
        ProductScreen.routeName: (ctx) => ProductScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ShopScreen.routeName) {
          final args = settings.arguments as ShopScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return ShopScreen(
                productName: args.productName,
                productDescription: args.productDescription,
                productPrice: args.productPrice,
                productImage: args.productImage,
                productRating: args.productRating,
                productReviews: args.productReviews,
              );
            },
          );
        } else if (settings.name == CartScreen.routeName) {
          final args = settings.arguments as CartScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return CartScreen(
                productName: args.productName,
                productPrice: args.productPrice,
                productImage: args.productImage,
              );
            },
          );
        }
        return null;
      },
    );
  }
}

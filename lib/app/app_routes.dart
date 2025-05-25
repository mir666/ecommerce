import 'package:ecommerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce/features/cart/ui/screens/payment_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:ecommerce/features/products/ui/screens/add_product_review_screen.dart';
import 'package:ecommerce/features/products/ui/screens/product_details_screen.dart';
import 'package:ecommerce/features/products/ui/screens/product_list_screen.dart';
import 'package:ecommerce/features/products/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings setting){
    late Widget route;

    if(setting.name == SplashScreen.name){
      route = const SplashScreen();
    } else if (setting.name == SignInScreen.name){
      route = const SignInScreen();
    } else if (setting.name == SignUpScreen.name){
      route = const SignUpScreen();
    } else if (setting.name == VerifyOtpScreen.name){
      String email = setting.arguments as String;
      route = VerifyOtpScreen(email: email,);
    } else if (setting.name == MainBottomNavBarScreen.name){
      route = const MainBottomNavBarScreen();
    } else if (setting.name == ProductListScreen.name){
      final String category = setting.arguments as String;
      route = ProductListScreen(category: category,);
    }else if (setting.name == ProductDetailsScreen.name) {
      String productId = setting.arguments as String;
      route = ProductDetailsScreen(productId: productId);
    } else if (setting.name == ProductReviewScreen.name){
      route = const ProductReviewScreen();
    } else if (setting.name == AddProductReviewScreen.name){
      route = const AddProductReviewScreen();
    } else if (setting.name == PaymentScreen.name) {
      double productId = setting.arguments as double;
      route = PaymentScreen(paymentAmount: productId);
    }

    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}
import 'package:apiprojectecom/views/auth/login_view.dart';
import 'package:apiprojectecom/views/auth/register_view.dart';
import 'package:apiprojectecom/views/cart/cart_page.dart';
import 'package:apiprojectecom/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import '../core/constants/route_constants.dart';
import '../views/home/home_view.dart';
import '../views/products/product_detail_view.dart';
import '../models/product.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteConstants.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RouteConstants.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RouteConstants.settings:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case RouteConstants.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
        case RouteConstants.cart:
        return MaterialPageRoute(builder: (_) => const CartPage());

      case RouteConstants.productDetail:
        if (args is Product) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailView(product: args),
          );
        }
        return errorRoute("Invalid product detail arguments");

      default:
        return errorRoute("Route not found");
    }
  }

  static Route<dynamic> errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Route Error")),
        body: Center(child: Text(message)),
      ),
    );
  }
}

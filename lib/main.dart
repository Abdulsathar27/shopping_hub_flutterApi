import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'core/constants/route_constants.dart';
import 'controllers/product_provider.dart';
import 'controllers/smartphone_provider.dart';
import 'controllers/auth_provider.dart';
import 'controllers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..checkLoginStatus()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => SmartphoneProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Shopping Hub",
            theme: AppTheme.lightTheme,

            // ✅ Auth Guard: initial route based on login state
            initialRoute: auth.isLoggedIn
                ? RouteConstants.home
                : RouteConstants.login,

            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}

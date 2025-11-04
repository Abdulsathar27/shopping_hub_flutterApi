import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_colors.dart';
import 'widgets/home_bottom_nav.dart';
import '../products/product_list_view.dart';
import '../smartphones/smartphone_list_view.dart';
import '../cart/cart_page.dart';
import '../settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    ProductListView(),
    SmartphoneListView(),
    CartPage(),
    SettingsView(),
  ];

  void onTabChanged(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final appTitles = [
      "Products",
      "Smartphones",
      "My Cart",
      "Settings",
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          appTitles[currentIndex],
          style: AppTextStyles.heading2.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),

     
      body: screens[currentIndex],

      
      bottomNavigationBar: HomeBottomNav(
        currentIndex: currentIndex,
        onTabSelected: onTabChanged,
      ),
    );
  }
}

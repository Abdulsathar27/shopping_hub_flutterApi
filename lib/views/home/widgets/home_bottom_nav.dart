import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/cart_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/sizes.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textLight,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
      onTap: onTabSelected,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.phone_android),
          label: "Smartphones",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(Icons.shopping_cart),
              if (cart.itemCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.paddingSmall),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.itemCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          label: "Cart",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}

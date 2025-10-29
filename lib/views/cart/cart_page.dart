import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_provider.dart';
import '../../core/constants/sizes.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.itemCount == 0) {
            return Center(
              child: Text(
                "Your cart is empty!",
                style: AppTextStyles.heading2,
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(Sizes.paddingMedium),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items.values.toList()[index];
                    final product = item.product;

                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: Sizes.marginMedium,
                      ),
                      padding: const EdgeInsets.all(Sizes.paddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius:
                            BorderRadius.circular(Sizes.radiusMedium),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          /// Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Sizes.radiusSmall,
                            ),
                            child: Image.network(
                              product.image,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: Sizes.spacingMedium),

                          /// Title & Price
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.subtitle,
                                ),
                                const SizedBox(height: Sizes.spacingSmall),
                                Text(
                                  "\$${product.price.toStringAsFixed(2)}",
                                  style: AppTextStyles.price,
                                ),
                              ],
                            ),
                          ),

                          /// Quantity Controls
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                color: AppColors.error,
                                iconSize: Sizes.iconMedium,
                                onPressed: () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  ).decreaseQuantity(product.id);
                                },
                              ),
                              Text(
                                item.quantity.toString(),
                                style: AppTextStyles.body,
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                color: AppColors.primary,
                                iconSize: Sizes.iconMedium,
                                onPressed: () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  ).increaseQuantity(product.id);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// Total + Checkout
              Container(
                padding: const EdgeInsets.all(Sizes.paddingLarge),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: AppTextStyles.heading2,
                        ),
                        Text(
                          "\$${cart.totalPrice.toStringAsFixed(2)}",
                          style: AppTextStyles.price,
                        ),
                      ],
                    ),
                    const SizedBox(height: Sizes.spacingLarge),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

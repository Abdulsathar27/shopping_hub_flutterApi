import 'package:apiprojectecom/controllers/cart_provider.dart';
import 'package:apiprojectecom/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../core/constants/sizes.dart';
import '../../core/constants/app_text_styles.dart';
import 'widgets/product_price.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;
  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Hero(
              tag: "product_image_${product.id}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.radiusMedium),
                child: Image.network(
                  product.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: Sizes.spacingLarge),

           
            Text(product.title, style: AppTextStyles.heading2),
            const SizedBox(height: Sizes.spacingMedium),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPrice(price: product.price),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: Sizes.spacingLarge),

          
            Text(
              product.description,
              style: AppTextStyles.body.copyWith(height: 1.4),
            ),

            const SizedBox(height: Sizes.spacingLarge * 2),

           
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addToCart(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.radiusLarge),
                      ),
                      margin: const EdgeInsets.all(Sizes.marginMedium),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white),
                          const SizedBox(width: Sizes.spacingSmall),
                          Text(
                            "Added to Cart!",
                            style: AppTextStyles.subtitle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

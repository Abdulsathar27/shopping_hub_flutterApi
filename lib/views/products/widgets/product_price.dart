import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final MainAxisAlignment alignment;

  const ProductPrice({
    super.key,
    required this.price,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: AppTextStyles.price,
        ),
      ],
    );
  }
}

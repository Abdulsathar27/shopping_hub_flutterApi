import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/sizes.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.paddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 50,
            color: Colors.red.shade400,
          ),
          const SizedBox(height: Sizes.spacingMedium),

          Text(
            "Oops! Something went wrong",
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: Sizes.spacingMedium),

          Text(
            message,
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: Sizes.spacingLarge),

          ElevatedButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}

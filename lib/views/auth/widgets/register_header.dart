import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/sizes.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Create Account", style: AppTextStyles.heading1),
        const SizedBox(height: Sizes.spacingMedium),
        Text("Sign up to get started", style: AppTextStyles.subtitle),
      ],
    );
  }
}
